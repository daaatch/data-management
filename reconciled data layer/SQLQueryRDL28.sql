insert into ReconciledDataLayer.dbo.reservations
SELECT 
concat('M-',m.Tkt_id),
cast(m.Tkt_cli as nvarchar(15)),
cast(m.Tkt_Nomecli as nvarchar(100)),
cast(m.Tkt_CodHotel as nvarchar(10)),
cast(m.Tkt_Sis as nvarchar(10)),
m.Tkt_ImpLordo,
m.Tkt_Provvigione,
m.Tkt_pax,
m.Tkt_notti,
m.Tkt_datadal,
m.Tkt_dataal,
cast(concat('M-',m.Tkt_codoperatore) as nvarchar(15)),
m.Tkt_datacreazione,
'Meridiano'
FROM meridiano.dbo.tkt AS m
WHERE m.Tkt_vettore NOT IN (
    SELECT v.vettori_cod 
    FROM meridiano.dbo.vettori AS v
) AND NOT m.Tkt_CodHotel='';