use aprender;


-- eliminar el padre y los hijos (Menu - dinamico)

DELIMITER //
create procedure eliminar_menu_padreHijo(in id_padre int)
begin
declare numero_vista_dis int default 0;
declare id_vista_desact int default 0;

ciclo_act: LOOP

set numero_vista_dis = (select count(id_vista) from vista where fk_master =id_padre and estado='activo');

set id_vista_desact= (select id_vista from vista where fk_master =id_padre and estado='activo' limit 1);
                   
if	numero_vista_dis is not null then
-- actualizar 
if numero_vista_dis > 0 then
      update vista set estado='D' where id_vista =id_vista_desact;
else
     LEAVE ciclo_act;
end if;
end if;
 END LOOP ciclo_act;
end//

-- call eliminar_menu_padreHijo('1');


DELIMITER //
create procedure eliminar_pregunta(in id_modulo_aux int)
begin
--  contenido
declare numero_contenido_dis int default 0;
declare consulta_id_modulo_aux int default 0;

ciclo_borrador: LOOP

set numero_contenido_dis = (select count(id_pregunta) from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
inner join prueba on contenido.id_contenido = prueba.fk_contenido inner join pregunta on prueba.id_prueba=pregunta.fk_prueba
where id_modulo = id_modulo_aux and pregunta.Estado_asignacion='1');


set consulta_id_modulo_aux = (select id_pregunta from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
inner join prueba on contenido.id_contenido = prueba.fk_contenido inner join pregunta on prueba.id_prueba=pregunta.fk_prueba
where id_modulo = id_modulo_aux and pregunta.Estado_asignacion='1' limit 1);

if	numero_contenido_dis is not null then

if numero_contenido_dis > 0 then
-- codigo
-- 1 asignado 0 - no asinado
update pregunta set Estado_asignacion = '0' where fk_prueba=consulta_id_modulo_aux;
else
 LEAVE ciclo_borrador;
end if;
end if;
 END LOOP ciclo_borrador;
end
//
-- call eliminar_pregunta('1');


 
DELIMITER //

create procedure eliminar_prueba(in id_modulo_aux int)
begin
--  contenido
declare numero_contenido_dis int default 0;
declare consulta_id_modulo_aux int default 0;

ciclo_borrador: LOOP

set numero_contenido_dis = (select count(id_prueba) from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
inner join prueba on contenido.id_contenido = prueba.fk_contenido 
where id_modulo = id_modulo_aux and prueba.estado_prueba='A' );


set consulta_id_modulo_aux = (select id_prueba from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
inner join prueba on contenido.id_contenido = prueba.fk_contenido 
where id_modulo = id_modulo_aux and prueba.estado_prueba='A' limit 1);


if	numero_contenido_dis is not null then

if numero_contenido_dis > 0 then
-- codigo
update prueba set estado_prueba = 'D' where fk_contenido=consulta_id_modulo_aux;
else
 LEAVE ciclo_borrador;
end if;
end if;
 END LOOP ciclo_borrador;
end
//

-- call eliminar_prueba('1');

DELIMITER //
create procedure eliminar_contenido(in id_modulo_aux int)
begin
--  contenido
declare numero_contenido_dis int default 0;
declare consulta_id_modulo_aux int default 0;

ciclo_borrador: LOOP
set numero_contenido_dis = (select count(id_contenido) from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
where id_modulo = id_modulo_aux and contenido.estado_contenido='A' );

set consulta_id_modulo_aux = (select id_contenido from modulo inner join contenido on modulo.id_modulo = contenido.fk_id_modulo
where id_modulo = id_modulo_aux and contenido.estado_contenido='A' limit 1);

if	numero_contenido_dis is not null then

if numero_contenido_dis > 0 then
-- codigo
update contenido set estado_contenido = 'D' where id_contenido=consulta_id_modulo_aux;
else
 LEAVE ciclo_borrador;
end if;
end if;
 END LOOP ciclo_borrador;
end
//

--  call eliminar_modulo('1');


DELIMITER //
create procedure eliminar_en_cascada(in id_modulo_aux int)
begin
call eliminar_pregunta(id_modulo_aux);
call eliminar_prueba(id_modulo_aux);
call eliminar_contenido(id_modulo_aux);
call eliminar_modulo(id_modulo_aux);
end
//

-- call eliminar_en_cascada('1');

-- DROP PROCEDURE IF EXISTS eliminar_pregunta;
-- DROP PROCEDURE IF EXISTS eliminar_prueba;
-- DROP PROCEDURE IF EXISTS eliminar_contenido;
 -- DROP PROCEDURE IF EXISTS eliminar_modulo;


