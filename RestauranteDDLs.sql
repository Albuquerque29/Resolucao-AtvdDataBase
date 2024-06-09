Create DATABASE RestaruanteDB;

-- Tabela Dim_Mesa
CREATE TABLE Dim_Mesa (
    IdMesa INT PRIMARY KEY AUTO_INCREMENT,
    Cod_Mesa INT(3) NOT NULL,
    QtdPessoasMesa INT(3) NOT NULL
);
-- Tabela Dim_Data
CREATE TABLE Dim_Data (
    IdData INT PRIMARY KEY AUTO_INCREMENT,
    DiaData DATE NOT NULL,
    CodDiaSemana VARCHAR(3) NOT NULL,
    CodMes VARCHAR(3) NOT NULL,
    AnoData INT NOT NULL
);

-- Tabela Dim_Promoção
CREATE TABLE Dim_Promocao (
    IdPromocao INT PRIMARY KEY AUTO_INCREMENT,
    Cod_Promocao INT(50) NOT NULL,
    PorcentagemPromocao VARCHAR(4) NOT NULL,
    Descricao VARCHAR(70) NOT NULL
);

-- Tabela Dim_Cliente
CREATE TABLE Dim_Cliente (
    IdCliente INT PRIMARY KEY AUTO_INCREMENT,
    NomeCliente VARCHAR(50) NOT NULL,
    TelefoneCliente INT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    IdadeCliente INT NOT NULL
);

-- Tabela Dim_Prato
CREATE TABLE Dim_Prato (
    IdPrato INT PRIMARY KEY AUTO_INCREMENT,
    NomePrato VARCHAR(50) NOT NULL,
    CodPrato INT(1) NOT NULL,
    CodTipoPrato INT(1) NOT NULL,
    PrecoUnitPrato FLOAT NOT NULL
);

-- Tabela Dim_Garcom
CREATE TABLE Dim_Garcom (
    IdGarcom INT PRIMARY KEY AUTO_INCREMENT,
    NomeGarcom VARCHAR(50) NOT NULL,
    CodTurno VARCHAR(1) NOT NULL
);

CREATE TABLE Fato_Pedidos (
    IdPedido INT PRIMARY KEY AUTO_INCREMENT,
    ValorTotalPedido DECIMAL(4,2) NOT NULL,
    QtdPratosPedido INT NOT NULL,
    CodPagamento INT NOT NULL,
    FkIdGarcom INT,
    FkIdData INT,
    FkIdCliente INT,
    FkIdPromocao INT,
    FkIdPrato INT,
    FkIdMesa INT,
    FOREIGN KEY (FkIdGarcom) REFERENCES Dim_Garcom(IdGarcom),
    FOREIGN KEY (FkIdData) REFERENCES Dim_Data(IdData),
    FOREIGN KEY (FkIdCliente) REFERENCES Dim_Cliente(IdCliente),
    FOREIGN KEY (FkIdPromocao) REFERENCES Dim_Promocao(IdPromocao),
    FOREIGN KEY (FkIdPrato) REFERENCES Dim_Prato(IdPrato),
    FOREIGN KEY (FkIdMesa) REFERENCES Dim_Mesa(IdMesa) );
