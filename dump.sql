-- Loo klientide tabel
CREATE TABLE client (
                        client_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale kliendile. Automaatne suurenev väärtus.',
                        name VARCHAR(100) NOT NULL COMMENT 'Kliendi nimi. Piiratud kuni 100 tähemärki, kuna nimed on tavaliselt lühikesed.',
                        email VARCHAR(100) UNIQUE NOT NULL COMMENT 'E-posti aadressid on unikaalsed ja varieeruva pikkusega, kuid tavaliselt mitte pikemad kui 100 märki.',
                        phone VARCHAR(15) DEFAULT NULL COMMENT 'Telefoninumber, maksimaalselt 15 märki rahvusvahelise vormingu jaoks.',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.'
);

-- Loo sihtkohtade tabel
CREATE TABLE destination (
                             destination_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale sihtkohale. Automaatne suurenev väärtus.',
                             name VARCHAR(100) NOT NULL COMMENT 'Sihtkoha nimi, näiteks linna või riigi nimi.',
                             country VARCHAR(100) DEFAULT NULL COMMENT 'Riigi nimi, kus sihtkoht asub. Võib jääda tühjaks, kui pole asjakohane.',
                             description TEXT DEFAULT NULL COMMENT 'Sihtkoha kirjeldus. Salvestatakse muutuva pikkusega tekst.',
                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.'
);

-- Loo broneeringute tabel
CREATE TABLE booking (
                         booking_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale broneeringule. Automaatne suurenev väärtus.',
                         client_id INT NOT NULL COMMENT 'Viide kliendile, kes on selle broneeringu loonud.',
                         type ENUM('flight', 'hotel', 'trip') NOT NULL COMMENT 'Broneeringu tüüp, nt lennupilet, hotell või reis.',
                         details TEXT DEFAULT NULL COMMENT 'Lisainfo broneeringu kohta. Muutuva pikkusega tekst.',
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.',
                         FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Loo lennureiside tabel
CREATE TABLE flight (
                        flight_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale lennureisile. Automaatne suurenev väärtus.',
                        client_id INT NOT NULL COMMENT 'Viide kliendile, kes on selle lennureisi loonud.',
                        airline VARCHAR(100) DEFAULT NULL COMMENT 'Lennufirma nimi.',
                        flight_number VARCHAR(50) DEFAULT NULL COMMENT 'Lennu number.',
                        departure_time DATETIME DEFAULT NULL COMMENT 'Lennu väljumisaeg (kuupäev ja kellaaeg).',
                        arrival_time DATETIME DEFAULT NULL COMMENT 'Lennu saabumisaeg (kuupäev ja kellaaeg).',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.',
                        FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Loo hotellibroneeringute tabel
CREATE TABLE hotel (
                       hotel_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale hotellibroneeringule. Automaatne suurenev väärtus.',
                       client_id INT NOT NULL COMMENT 'Viide kliendile, kes on selle hotellibroneeringu loonud.',
                       name VARCHAR(100) NOT NULL COMMENT 'Hotelli nimi.',
                       address TEXT DEFAULT NULL COMMENT 'Hotelli aadress.',
                       check_in DATE NOT NULL COMMENT 'Hotelli sisse registreerimise kuupäev.',
                       check_out DATE NOT NULL COMMENT 'Hotelli välja registreerimise kuupäev.',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.',
                       FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Loo reiside tabel
CREATE TABLE trip (
                      trip_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unikaalne ID igale reisile. Automaatne suurenev väärtus.',
                      client_id INT NOT NULL COMMENT 'Viide kliendile, kes on selle reisi loonud.',
                      name VARCHAR(100) NOT NULL COMMENT 'Reisi nimi.',
                      description TEXT DEFAULT NULL COMMENT 'Reisi kirjeldus.',
                      date DATE NOT NULL COMMENT 'Reisi kuupäev.',
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Kirje loomise kuupäev ja kellaaeg.',
                      FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);