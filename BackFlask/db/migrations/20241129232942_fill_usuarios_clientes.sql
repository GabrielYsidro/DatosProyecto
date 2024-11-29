-- migrate:up
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('12345678901', 1);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('98765432102', 2);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('45678912303', 3);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('78912345604', 4);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('32165498705', 5);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('15975348606', 6);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('75395185207', 7);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('85245612308', 8);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('95135725809', 9);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('12378945610', 10);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('74185296311', 11);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('96325874112', 12);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('15948675313', 13);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('75325895114', 14);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('35715948615', 15);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('65498732116', 16);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('98732165417', 17);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('85296374118', 18);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('25874196319', 19);
INSERT INTO usuarios_cliente (ruc, id_usuario) VALUES ('14785236920', 20);

-- migrate:down
DROP TABLE usuarios_cliente;
