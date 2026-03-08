insert into reconcileddatalayer.dbo.operators (id, type, clientcode, operatorcode, name, language, phone, email, corporation, address, postalcode, city, province, country, dateins)
select
	cast(concat('C-', conti.id) as nvarchar(10)),
	case when conti.tipo = 'Cliente' then 'CLIENT' else 'ADMIN' end,
	cast(concat('C-', conti.CodCli) as nvarchar(10)),
	cast(concat('C-', conti.CodOperatore) as nvarchar(10)),
	cast(conti.DescOperatore as nvarchar(50)),
	case 
		when conti.linguacli is null 
		then (case when conti.country is null then '' else cast(conti.country as nvarchar(3)) end)
		else cast(conti.Linguacli as nvarchar(3)) end,
	cast(conti.Telefono as nvarchar(15)),
	cast(conti.Email as nvarchar(50)),
	cast(conti.Denominazione as nvarchar(50)),
	cast(conti.Indirizzo as nvarchar(100)),
	cast(conti.cap as nvarchar(10)),
	cast(conti.Citta as nvarchar(25)),
	cast(conti.Provincia as nvarchar(2)),
	case when conti.country is null then '' else cast(conti.country as nvarchar(3)) end,
	conti.Datainserimento
from contitravel.dbo.anagrafica as conti