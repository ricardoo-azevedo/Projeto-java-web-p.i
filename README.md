# Java-web-pi

## Banco de dados: 

```mermaid
erDiagram
    UNIDADESAUDE {
        INT idUnidadeSaude PK
        VARCHAR nome
        INT idEndereco FK
    }
    
    ENDERECO {
        INT idEndereco PK
        VARCHAR logradouro
        VARCHAR numero
        VARCHAR complemento
        VARCHAR bairro
        VARCHAR cidade
        VARCHAR uf
        VARCHAR cep
    }
    
    TELEFONE {
        INT idTelefone PK
        VARCHAR numero
        ENUM tipo
        INT idPaciente FK
        INT idMedico FK
        INT idUnidadeSaude FK
    }
    
    PACIENTE {
        INT idPaciente PK
        VARCHAR nome
        VARCHAR CPF
        DATE data_nascimento
    }

    FAMILIA {
        INT idFamilia PK
        INT idResponsavel FK
    }

    MEDICO {
        INT idMedico PK
        VARCHAR nome
        VARCHAR CRM
        INT idEspecialidade FK
    }

    ESPECIALIDADE {
        INT idEspecialidade PK
        VARCHAR nome
    }

    AGENDAMENTO {
        INT idAgendamento PK
        INT idPaciente FK
        INT idMedico FK
        DATETIME data_hora
        VARCHAR statusAgendamento
        TEXT observacoes
    }

    UNIDADESAUDE ||--o{ ENDERECO : "1,1"
    TELEFONE }o--|| PACIENTE : "0,N"
    TELEFONE }o--|| MEDICO : "0,N"
    TELEFONE }o--|| UNIDADESAUDE : "0,N"
    PACIENTE ||--|{ FAMILIA : "1,1"
    AGENDAMENTO }o--|| PACIENTE : "0,N"
    AGENDAMENTO }o--|| MEDICO : "0,N"
    MEDICO }o--|| ESPECIALIDADE : "0,N"

```

## Diagrama de Classe:

```mermaid
classDiagram
    class UnidadeSaude {
        +int idUnidadeSaude
        +String nome
        +Endereco endereco
    }
    
    class Endereco {
        +int idEndereco
        +String logradouro
        +String numero
        +String complemento
        +String bairro
        +String cidade
        +String uf
        +String cep
    }

    class Telefone {
        +int idTelefone
        +String numero
        +Enum tipo
        +Paciente paciente
        +Medico medico
        +UnidadeSaude unidadeSaude
    }

    class Paciente {
        +int idPaciente
        +String nome
        +String CPF
        +Date data_nascimento
        +Familia familia
    }

    class Familia {
        +int idFamilia
        +Paciente responsavel
    }

    class Medico {
        +int idMedico
        +String nome
        +String CRM
        +Especialidade especialidade
    }

    class Especialidade {
        +int idEspecialidade
        +String nome
    }

    class Agendamento {
        +int idAgendamento
        +Paciente paciente
        +Medico medico
        +DateTime data_hora
        +String statusAgendamento
        +String observacoes
    }

    UnidadeSaude "1" -- "1" Endereco : "localizado em"
    Telefone "0..N" -- "1" Paciente : "pertence a"
    Telefone "0..N" -- "1" Medico : "associado a"
    Telefone "0..N" -- "1" UnidadeSaude : "pertence a"
    Paciente "1" -- "1" Familia : "faz parte de"
    Agendamento "0..N" -- "1" Paciente : "agendado para"
    Agendamento "0..N" -- "1" Medico : "realizado por"
    Medico "0..N" -- "1" Especialidade : "especializa-se em"





```
