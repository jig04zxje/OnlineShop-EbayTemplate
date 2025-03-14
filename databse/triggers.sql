
CREATE TRIGGER trg_after_user_insert
ON [user]
AFTER INSERT
AS
BEGIN
    -- Insert into Cart table for the new user if role_id = 2
    INSERT INTO Cart (user_id)
    SELECT i.id
    FROM inserted i
    WHERE i.role_id = 2;
END;
GO

CREATE TRIGGER trg_DeleteCartItemOnZeroQuantity
ON cart_item
AFTER UPDATE
AS
BEGIN
    -- Check if the quantity was updated to 0
    DELETE FROM cart_item
    WHERE id IN (
        SELECT i.id
        FROM inserted i
        JOIN deleted d ON i.id = d.id
        WHERE i.quantity = 0
    );
END;
GO

