-- Exclui o esquema 'easy-store' se ele existir
DROP SCHEMA IF EXISTS `easy-store`;

-- Cria o esquema 'easy-store' se ele não existir
CREATE SCHEMA IF NOT EXISTS `easy-store` DEFAULT CHARACTER SET utf8;
USE `easy-store`;

-- Cria a tabela 'Funcionario' se ela não existir
CREATE TABLE IF NOT EXISTS `easy-store`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT, -- Identificador único do funcionário
  `nomeFuncionario` VARCHAR(45) NOT NULL, -- Nome do funcionário
  `senhaFuncionario` VARCHAR(45) NOT NULL, -- Senha do funcionário
  `cargoFuncionario` ENUM("Gerente", "Manutenção", "Almoxarife") NOT NULL, -- Cargo do funcionário
  PRIMARY KEY (`idFuncionario`)) -- Chave primária da tabela
ENGINE = InnoDB;

-- Cria a tabela 'Produtos' se ela não existir
CREATE TABLE IF NOT EXISTS `easy-store`.`Produtos` (
  `idProduto` INT NOT NULL, -- Identificador único do produto
  `nomeProduto` VARCHAR(45) NOT NULL, -- Nome do produto
  `quantidadeProduto` INT NOT NULL, -- Quantidade do produto
  PRIMARY KEY (`idProduto`)) -- Chave primária da tabela
ENGINE = InnoDB;

-- Cria a tabela 'Fornecedor' se ela não existir
CREATE TABLE IF NOT EXISTS `easy-store`.`Fornecedor` (
  `idFornecedor` INT NOT NULL, -- Identificador único do fornecedor
  `nomeFornecedor` VARCHAR(45) NULL, -- Nome do fornecedor
  PRIMARY KEY (`idFornecedor`)) -- Chave primária da tabela
ENGINE = InnoDB;

-- Cria a tabela 'Registro' se ela não existir
CREATE TABLE IF NOT EXISTS `easy-store`.`Registro` (
  `idFuncionario` INT NOT NULL, -- Identificador do funcionário que fez o registro
  `idProduto` INT NOT NULL, -- Identificador do produto registrado
  `idRegisto` INT NOT NULL AUTO_INCREMENT, -- Identificador único do registro
  `quantidadeRegistro` INT NOT NULL, -- Quantidade registrada
  `tipoRegistro` ENUM("entrada", "saida", "avaria") NOT NULL, -- Tipo de registro
  `dataValidade` DATE NULL, -- Data de validade do produto (se aplicável)
  `loteProduto` INT NOT NULL, -- Lote do produto
  `Fornecedor_idFornecedor` INT NOT NULL, -- Identificador do fornecedor
  PRIMARY KEY (`idRegisto`), -- Chave primária da tabela
  FOREIGN KEY (`idFuncionario`)
    REFERENCES `easy-store`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`idProduto`)
    REFERENCES `easy-store`.`Produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `easy-store`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;