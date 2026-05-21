-- ============================================================
-- Innovatech - Script de inicialización de base de datos
-- Tablas: ventas, despachos
-- ============================================================

CREATE DATABASE IF NOT EXISTS innovatech;
USE innovatech;

-- Tabla de Ventas (Órdenes de compra)
CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN DEFAULT FALSE
);

-- Tabla de Despachos
CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_despacho DATE,
    patente_camion VARCHAR(20),
    intento INT DEFAULT 0,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN DEFAULT FALSE
);

-- Datos de ejemplo: Ventas
INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) VALUES
    ('Av. Libertador 1234, Santiago', 85000, '2025-05-10', FALSE),
    ('Calle Falsa 742, Viña del Mar', 42000, '2025-05-11', FALSE),
    ('Pasaje Los Aromos 88, Valparaíso', 125000, '2025-05-12', TRUE),
    ('Camino El Alba 45, Concepción', 67000, '2025-05-13', FALSE),
    ('Av. Brasil 990, Temuco', 33000, '2025-05-14', FALSE);

-- Datos de ejemplo: Despachos
INSERT INTO despacho (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) VALUES
    ('2025-05-15', 'ABCD-12', 1, 3, 'Pasaje Los Aromos 88, Valparaíso', 125000, FALSE);

-- fin de script de inicializacion

