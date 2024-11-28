-- Creación de la tabla de clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE NOT NULL,
    estado VARCHAR(50) DEFAULT 'activo' -- activo, inactivo
);

-- Creación de la tabla de planes o suscripciones
CREATE TABLE Planes (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_plan VARCHAR(100) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    duracion_meses INT NOT NULL -- Duración del plan en meses
);

-- Creación de la tabla de suscripciones
CREATE TABLE Suscripciones (
    suscripcion_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    plan_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado VARCHAR(50) DEFAULT 'activa', -- activa, cancelada, expirada
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (plan_id) REFERENCES Planes(plan_id)
);

-- Creación de la tabla de razones de cancelación
CREATE TABLE Razones_Cancelacion (
    razon_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL
);

-- Creación de la tabla de cancelaciones
CREATE TABLE Cancelaciones (
    cancelacion_id INT PRIMARY KEY AUTO_INCREMENT,
    suscripcion_id INT NOT NULL,
    razon_id INT NOT NULL,
    fecha_cancelacion DATE NOT NULL,
    comentarios VARCHAR(255),
    FOREIGN KEY (suscripcion_id) REFERENCES Suscripciones(suscripcion_id),
    FOREIGN KEY (razon_id) REFERENCES Razones_Cancelacion(razon_id)
);

-- Creación de la tabla de métricas de churn rate
CREATE TABLE Churn_Rate_Metricas (
    metrica_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio_periodo DATE NOT NULL,
    fecha_fin_periodo DATE NOT NULL,
    clientes_iniciales INT NOT NULL,
    clientes_finales INT NOT NULL,
    tasa_churn DECIMAL(5, 2) GENERATED ALWAYS AS ((clientes_iniciales - clientes_finales) / clientes_iniciales * 100) STORED
);
