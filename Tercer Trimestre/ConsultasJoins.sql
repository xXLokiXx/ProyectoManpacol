/** Consultas **/
-- Cantidad de material por tipo
select count(m.id), tm.Descripcion from Material as m
join tipomaterial as tm on m.IdTipoMaterial=tm.Id
group by IdTipoMaterial;

-- Materiales màs utilizados
select  s.idMaterial, m.color,m.IdTextura as'Textura',  m.idproveedor, tm.Descripcion from detallessalida as s
join material as m on s.idMaterial=m.Id
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id 
group by s.IdMaterial
order by s.idMaterial asc limit 3;
 
 -- detalles de la salida de los materiales
select s.*,ds.* from salida as s
join detallessalida as ds on ds.idSalida=s.Id; 

-- Cantidad de materiales importados
select count(m.id) as 'No. Materiales', p.Nombre, p.PaisOrigen from material as m 
join proveedor as p on m.IdProveedor=p.Id
group by p.Id  having p.PaisOrigen<>'Colombia';

-- Cantidad de materiales nacionales
select count(m.id) as 'No. Materiales', p.Nombre, p.PaisOrigen from material as m 
join proveedor as p on m.IdProveedor=p.Id
group by p.Id  having p.PaisOrigen='Colombia';

-- Materiales importados
select m.id, tm.Descripcion, m.IdProveedor, p.Nombre from material as m
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id
join proveedor as p on m.IdProveedor=p.ID
where p.PaisOrigen<>'Colombia';

-- Materiales nacionales
select m.id, tm.Descripcion, m.IdProveedor, p.Nombre from material as m
join TipoMaterial as tm on m.IdTipoMaterial=tm.Id
join proveedor as p on m.IdProveedor=p.ID
where p.PaisOrigen='Colombia';





 
 