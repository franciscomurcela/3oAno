use p10g2

go

----------------------------Triggers---------------------------------

--Before inserting a new record into the adocoes table, check if the CCAdotante exists in the adotante table.
CREATE TRIGGER before_insert_adocoes
BEFORE INSERT ON adocoes
FOR EACH ROW
BEGIN
    IF NEW.CCAdotante NOT IN (SELECT CC FROM adotante) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Adotante does not exist';
    END IF;
END;

--After a new pet is added, update the EstadoDeAdocao field to 0 (not adopted).
CREATE TRIGGER after_insert_pet
AFTER INSERT ON pet
FOR EACH ROW
BEGIN
    UPDATE pet SET EstadoDeAdocao = 0 WHERE Id = NEW.Id;
END;

--After a pet is adopted, update the EstadoDeAdocao field in the pet table.
CREATE TRIGGER after_update_adocoes
AFTER UPDATE ON adocoes
FOR EACH ROW
BEGIN
    IF NEW.EstadoAdocaoPet = 1 THEN
        UPDATE pet SET EstadoDeAdocao = 1 WHERE Id = NEW.IdPet;
    END IF;
END;


--Before updating the EstadoAdocaoPet in the adocoes table, check if the pet is already adopted.
CREATE TRIGGER before_update_adocoes
BEFORE UPDATE ON adocoes
FOR EACH ROW
BEGIN
    IF NEW.EstadoAdocaoPet = 1 AND OLD.EstadoAdocaoPet = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pet is already adopted';
    END IF;
END;


--Before deleting a record from the utilizador table, check if the user has any adopted pets.

CREATE TRIGGER before_delete_utilizador
BEFORE DELETE ON utilizador
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM adocoes WHERE CCAdotante = OLD.CC AND EstadoAdocaoPet = 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User has adopted pets, cannot delete';
    END IF;
END;


--After inserting a new row in the pet table, check the type of the pet. If it's a cat, insert a new row in the cat table with the same ID. If it's a dog, insert a new row in the dog table with the same ID.
CREATE TRIGGER after_pet_insert
AFTER INSERT ON pet
FOR EACH ROW
BEGIN
  IF NEW.Type = 'Cat' THEN
    INSERT INTO cat (IdCat) VALUES (NEW.Id);
  ELSEIF NEW.Type = 'Dog' THEN
    INSERT INTO dog (IdDog) VALUES (NEW.Id);
  END IF;
END





CREATE TRIGGER trg_CheckPetAge
ON Pet
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @motherAge INT
    DECLARE @fatherAge INT
    DECLARE @errorMsg VARCHAR(100)
    DECLARE @newPetId INT
    DECLARE @newPetAge INT
    DECLARE @motherId INT
    DECLARE @fatherId INT

    -- Assuming only one row is inserted at a time
    SELECT @newPetId = Id, @newPetAge = Idade, @motherId = IdMae, @fatherId = IdPai
    FROM inserted

    -- Check age of mother
    IF @motherId IS NOT NULL
    BEGIN
        SELECT @motherAge = Idade FROM Pet WHERE Id = @motherId
        IF @newPetAge > @motherAge
        BEGIN
            SET @errorMsg = 'The pet cannot be older than its mother. Mother''s age: ' + CAST(@motherAge AS VARCHAR)
            RAISERROR (@errorMsg, 16, 1)
            RETURN
        END
    END

    -- Check age of father
    IF @fatherId IS NOT NULL
    BEGIN
        SELECT @fatherAge = Idade FROM Pet WHERE Id = @fatherId
        IF @newPetAge > @fatherAge
        BEGIN
            SET @errorMsg = 'The pet cannot be older than its father. Father''s age: ' + CAST(@fatherAge AS VARCHAR)
            RAISERROR (@errorMsg, 16, 1)
            RETURN
        END
    END

    -- If all checks pass, insert the new pet
    INSERT INTO Pet (Id, Idade, IdMae, IdPai)
    SELECT Id, Idade, IdMae, IdPai FROM inserted
END



