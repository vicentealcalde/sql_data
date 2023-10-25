-- Crear la tabla "User"
CREATE TABLE IF NOT EXISTS "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    address TEXT,
    telephone_number VARCHAR(20)
);

-- Crear la tabla "Admin"
CREATE TABLE IF NOT EXISTS "Admin" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    telephone_number VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

-- Crear la tabla "Gate"
CREATE TABLE IF NOT EXISTS "Gate" (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    telephone_number VARCHAR(255) NOT NULL,
    status BOOLEAN NOT NULL,
    address VARCHAR(255),
    commune VARCHAR(255) NOT NULL,
    region VARCHAR(255),
    type_gate VARCHAR(255) NOT NULL
);

-- Crear la tabla "Superadmin"
CREATE TABLE IF NOT EXISTS "Superadmin" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insertar un registro en la tabla "Superadmin"
INSERT INTO "Superadmin" (username, password) VALUES ('admin123', '1234');

-- Crear la tabla "Admin_Gate"
CREATE TABLE IF NOT EXISTS "Admin_Gate" (
    id SERIAL PRIMARY KEY,
    id_gate INT NOT NULL,
    id_admin INT NOT NULL,
    FOREIGN KEY (id_admin) REFERENCES "Admin"(id),
    FOREIGN KEY (id_gate) REFERENCES "Gate"(id)
);

-- Crear la tabla "User_Gate"
CREATE TABLE IF NOT EXISTS "User_Gate" (
    id SERIAL PRIMARY KEY,
    id_gate INT NOT NULL,
    id_user INT NOT NULL,
    id_admin INT NOT NULL,
    residente BOOLEAN,
    end_date DATE,
    start_date DATE,
    FOREIGN KEY (id_user) REFERENCES "User"(id),
    FOREIGN KEY (id_gate) REFERENCES "Gate"(id),
    FOREIGN KEY (id_admin) REFERENCES "Admin"(id)
);

-- Crear la tabla "Logs"
CREATE TABLE IF NOT EXISTS "Logs" (
    id SERIAL PRIMARY KEY,
    id_gate INT NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_gate) REFERENCES "Gate"(id)
);

-- Crear la tabla "Logs_back"
CREATE TABLE IF NOT EXISTS "Logs_back" (
    id SERIAL PRIMARY KEY,
    id_gate INT NOT NULL,
    id_user INT NOT NULL,
    id_admin INT NOT NULL,
    action VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_user) REFERENCES "User"(id),
    FOREIGN KEY (id_gate) REFERENCES "Gate"(id),
    FOREIGN KEY (id_admin) REFERENCES "Admin"(id)
);
