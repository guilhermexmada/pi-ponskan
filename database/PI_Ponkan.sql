-- criando a database do Projeto Integrador
create database PI_Ponkan;
use PI_Ponkan;

-- iniciando criação das tabelas
create table usuarios(
    id int auto_increment primary key,
    nome varchar(100) not null,
    faculdade varchar(100),
    curso varchar(100) not null,
    email varchar(255),
    senha varchar(20) not null,
    telefone varchar(15),
    data_nasci date not null,
    tipo_acesso varchar(50) not null,
    endereco varchar(255),
    cnpj varchar(20) not null
);

-- tabela de doenças e sintomas relacionadas
create table doencas(
    id int auto_increment primary key,
    nome_doenca varchar(100) not null,
    descricao varchar(255),
    agente varchar(100),
    tratamento varchar(255),
    profilaxia varchar(255)
);

create table sintomas(
    id int auto_increment primary key,
    doenca_id int,
    nome varchar(100) not null,
    descricao varchar(255),
    foreign key (doenca_id) references doencas(id)
);

-- usuario pesquisa na biblioteca de doenças
-- entidade associativa entre usuario e doenças
create table pesquisa_biblioteca(
    id int auto_increment primary key,
    usuario_id int,
    doencas_id int,
    foreign key (usuario_id) references usuarios(id),
    foreign key (doencas_id) references doencas(id)
);

-- usuario carrega/captura fotos, que gera classificações
-- fotos capturam dados momentaneos 
create table fotos(
    id int auto_increment primary key,
    usuario_id int,
    caminho varchar(255) not null,
    data datetime,
    hora time,
    coordenadas varchar(50),
    caso int,
    foreign key (usuario_id) references usuarios(id)
);

-- classificações produzem diagnosticos
create table classificacoes(
    id int auto_increment primary key,
    foto_id int,
    man_trincada varchar(50),
    falsa_melanose varchar(50),
    tempo varchar(10),
    pinta_preta varchar(50),
    saudavel varchar(50),
    man_preta varchar(50),
    man_virulenta varchar(50),
    man_sardenta varchar(50),
    foreign key(foto_id) references fotos(id)
);

-- usuario produz/atualiza plano de ação
-- plano de ação atualiza diagnosticos
create table planos_acao(
    id int auto_increment primary key,
    usuario_id int,
    avaliacao varchar(255),
    valor_final decimal(10,2),
    validade date,
    foreign key (usuario_id) references usuarios(id)
);

create table diagnosticos(
    id int auto_increment primary key,
    classificacao_id int,
    plano_id int,
    problema varchar(150),
    gravidade varchar(50),
    foreign key (classificacao_id) references classificacoes(id),
    foreign key (plano_id) references planos_acao(id)
);

-- ações possuem planos de ação e consultam dados temporais
create table acoes(
    id int auto_increment primary key,
    plano_id int,
    dt_hr_inicio datetime,
    dt_hr_fim datetime,
    coordenadas varchar(50),
    tipo varchar(100),
    fonte varchar(100),
    titulo varchar(100),
    descricao varchar(255),
    prioridade varchar(50),
    justificativa varchar(255),
    valor decimal(10,2),
    foreign key (plano_id) references planos_acao(id)
);

/*
Criando a tabela de dados temporais que servirá como tabela pai para:
- momentaneo
- historico
- previsivo
*/
create table dados_temporais(
    id_dado int auto_increment primary key,
    latitude decimal(10,6),
    longitude decimal(10,6),
    dt_hora_coleta datetime,
    fonte varchar(100)
);

/*
Momentaneo é a unica sem auto_increment pois esta diretamente ligado aos dados temporais
Já as outras terão seu proprio id unico, por isso o auto_increment
*/
create table momentaneo(
    id_dado int primary key,
    temperatura decimal(5,2),
    umidade decimal(5,2),
    prec decimal(5,2),
    velocidade_vento decimal(5,2),
    direcao_vento varchar(10),
    id_rota int,
    foreign key (id_dado) references dados_temporais(id_dado)
);

create table historico(
    id_historico int auto_increment primary key,
    id_dado int,
    media_temperatura decimal(5,2),
    media_umidade decimal(5,2),
    media_prec decimal(5,2),
    data_inicio datetime,
    data_fim datetime,
    foreign key (id_dado) references dados_temporais(id_dado)
);

create table previsivo(
    id_previsivo int auto_increment primary key,
    id_dado int,
    data_inicio datetime,
    data_fim datetime,
    temp decimal(5,2),
    umid decimal(5,2),
    prec decimal(5,2),
    probabilidade_prec decimal(5,2),
    vel_vento decimal(5,2),
    direcao_vento varchar(10),
    foreign key (id_dado) references dados_temporais(id_dado)
);

-- entidade associativa entre as ações e dados temporais
create table consulta_temporal(
    id_consulta int auto_increment primary key,
    acao_id int,
    id_dado_previsivo int,
    id_dado_historico int,
    foreign key (acao_id) references acoes(id),
    foreign key (id_dado_previsivo) references previsivo(id_previsivo),
    foreign key (id_dado_historico) references historico(id_historico)
);

-- populando a tabela usuarios com exemplos
insert into usuarios (nome, faculdade, curso, email, senha, telefone, data_nasci, tipo_acesso, endereco, cnpj) values
('Ademar Robson Silva', 'Fatec DSM','Análise e Desenvolvimento de Sistemas','ademar.100@gmail.com','ademar123','(11)98765-4321','2000-05-10','aluno','Rua Antonio das Cruzes, 123','00.000.000/0001-00'),
('Mariano Neves', 'Fatec DSM','Análise e Desenvolvimento de Sistemas','NevesMariano@gmail.com','profsenha','(11)98888-7777','1990-03-20','professor','Av Boulevard Fonseca, 456','11.111.111/0001-11'),
('Myrella Dias', 'Universidade X','Biomedicina','MymyDias@gmail.com','Dokidoki456','(11)97654-3210','1998-11-30','aluno','Rua DomCastellani, 789','22.222.222/0001-33');

-- Próximo passo: popular as tabelas: doenças, sintomas, planos_ação e dados_temporais
-- Depois criar procedures para automatizar processos como inserção de fotos, criação de classificações e diagnosticos.

insert into doencas (nome_doenca, descricao, agente, tratamento, profilaxia) values
('Mancha Preta', 'Doenca fungica que afetas as folhas e frutos da Ponkan, causando manchas escuras e queda prematura dos frutos.', 'Fungo Phyllosticta citricarpa', 'Aplicacao de Fungicidas especificos e manejo adequado da plantacao.', 'Evitar excesso de umidade, realizar podas para melhorar a ventilacao e utilizar sementes certificadas.'),
('Falsa Melanose', 'Doenca que provoca manchas amareladas nas folhas e frutos, afetando a qualidade da fruta.', 'Fungo Guignardia citricarpa', 'Uso de fungicidas apropriados e praticas culturais adequadas.', 'Manter a plantacao limpa, evitar o acumulo de folhas caidas e restos de poda.'),
('MNA Virulenta', 'Doenca bacteriana que causa manchas oleosas nas folhas e frutos, levando a queda prematura e perda de qualidade.', 'Bacteria Xanthomonas citri subsp. citri', 'Aplicacao de bactericidas e manejo integrado de pragas.', 'Utilizar mudas certificadas, evitar ferimentos nas plantas e praticar rotacao de culturas.');

insert into sintomas (doenca_id, nome, descricao) values
(1, 'Manchas Pretas', 'Manchas escuras que aparecem nas folhas e frutos, levando a queda prematura dos frutos.'),
(2, 'Manchas Amareladas', 'Manchas de cor amarela que surgem nas folhas e frutos, afetando a qualidade da fruta.'),
(3, 'Manchas Oleosas', 'Manchas com aspecto oleoso que aparecem nas folhas e frutos, causando queda prematura e perda de qualidade dos frutos.');

insert into planos_acao (usuario_id, avaliacao, valor_final, validade) values
(1, 'Plano de acao para controle de Mancha Preta', 150.00, '2024-12-31'),
(2, 'Plano de acao para controle de Falsa Melanose', 200.00, '2025-06-30'),
(3, 'Plano de acao para controle de MNA Virulenta', 100.00, '2024-11-30');

insert into dados_temporais (latitude, longitude, dt_hora_coleta, fonte) values
( -23.550520, -46.633308, '2024-06-01 10:00:00', 'Estacao Meteorologica A'),
( -22.906847, -43.172896, '2025-09-15 14:00:00', 'Estacao Meteorologica B'),
( -19.916681, -43.934493, '2024-12-20 09:30:00', 'Estacao Meteorologica C');

-- criacao das procedures:

-- procedure para inserir fotos e ja vincular ao usuario, com validação de usuário
delimiter //
create procedure inserir_foto(
    in_p_usuario_id int, -- id do usuario que esta inserindo a foto
    in_p_caminho varchar(255), -- caminho da foto
    in_p_data datetime, 
    in_p_hora time,
    in_p_coordenadas varchar(50),
    in_p_caso int,
    out p_foto_id int -- id da foto inserida
)
begin
    if not exists (select 1 from usuarios where id = in_p_usuario_id) then
        signal sqlstate '45000' set message_text = 'Usuário não encontrado';
    else
        insert into fotos (usuario_id, caminho, data, hora, coordenadas, caso) values
        (in_p_usuario_id, in_p_caminho, in_p_data, in_p_hora, in_p_coordenadas, in_p_caso);
        set p_foto_id = last_insert_id();
    end if;
end //
delimiter ;

-- procedure para criar classificacao e diagnosticos automaticamente, ajustada para estrutura das tabelas
delimiter //
create procedure criar_classificacao_diagnostico(
    in_p_foto_id int,
    in_p_man_preta varchar(50),
    in_p_mna_virulenta varchar(50),
    in_p_plano_id int,
    in_p_problema varchar(150),
    in_p_gravidade varchar(50)
)
begin
    declare v_classificacao_id int;
    -- Insere classificação preenchendo campos existentes
    insert into classificacoes (foto_id, man_preta, mna_virulenta) values
    (in_p_foto_id, in_p_man_preta, in_p_mna_virulenta);
    set v_classificacao_id = last_insert_id();
    -- Insere diagnóstico vinculado à classificação e plano
    insert into diagnosticos (classificacao_id, plano_id, problema, gravidade) values
    (v_classificacao_id, in_p_plano_id, in_p_problema, in_p_gravidade);
end //

delimiter ;
