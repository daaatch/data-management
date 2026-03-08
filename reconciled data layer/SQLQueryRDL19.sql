insert into reconcileddatalayer.dbo.operators (id, type, clientcode, operatorcode, name, language, phone, email, corporation, address, postalcode, city, province, country, dateins)
select
	cast(concat('M-', meridiano.id) as nvarchar(10)),
	case when meridiano.tipo = 'Cliente' then 'CLIENT' else 'ADMIN' end,
	cast(concat('M-', meridiano.CodCli) as nvarchar(10)),
	cast(concat('M-', meridiano.CodOperatore) as nvarchar(10)),
	cast(meridiano.DescOperatore as nvarchar(50)),
	case 
		when meridiano.linguacli is null 
		then (case when meridiano.country is null then '' else cast(meridiano.country as nvarchar(3)) end)
		else cast(meridiano.Linguacli as nvarchar(3)) end,
	case when meridiano.telefono is null then '' else cast(meridiano.Telefono as nvarchar(15)) end,
	case when meridiano.email is null then '' else cast(meridiano.Email as nvarchar(50)) end,
	cast(meridiano.Denominazione as nvarchar(50)),
	case when meridiano.indirizzo is null then '' else cast(meridiano.Indirizzo as nvarchar(100)) end,
	cast(meridiano.cap as nvarchar(10)),
	cast(meridiano.Citta as nvarchar(25)),
	cast(meridiano.Provincia as nvarchar(2)),
	case when meridiano.country is null then '' else cast(meridiano.country as nvarchar(3)) end,
	meridiano.Datainserimento
from meridiano.dbo.anagrafica as meridiano