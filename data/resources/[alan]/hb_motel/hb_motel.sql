CREATE TABLE IF NOT EXISTS motel_rentals (
    citizenid VARCHAR(50) NOT NULL,
    motel VARCHAR(50) NOT NULL,
    room INT NOT NULL,
    rent_timestamp BIGINT NOT NULL,
    PRIMARY KEY (motel, room)
);