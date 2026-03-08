insert into ReconciledDataLayer.dbo.reservations
SELECT 
concat('C-',t.Tkt_id),
cast(t.Tkt_cli as nvarchar(15)),
cast(t.Tkt_Nomecli as nvarchar(100)),
cast(t.Tkt_CodHotel as nvarchar(10)),
cast(t.Tkt_Sis as nvarchar(10)),
t.Tkt_ImpLordo,
t.Tkt_Provvigione,
t.Tkt_pax,
t.Tkt_notti,
t.Tkt_datadal,
t.Tkt_dataal,
cast(concat('C-',t.Tkt_codoperatore) as nvarchar(15)),
t.Tkt_datacreazione,
'ContiTravel'
FROM contitravel.dbo.tkt AS t
WHERE t.Tkt_vettore NOT IN (
    SELECT v.vettori_cod 
    FROM meridiano.dbo.vettori AS v
) AND NOT t.Tkt_CodHotel='';