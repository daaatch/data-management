insert into ReconciledDataLayer.dbo.packages 
select 
m.PACC_ID,
'ContiTravel',
concat('C-',m.pacc_id),
m.pacc_descr,
m.pacc_datad,
m.pacc_dataa,
cast(m.pacc_area as nvarchar(3)),
cast(m.pacc_dest as nvarchar(3)),
cast(m.pacc_soggiorno as nvarchar(3))
from contitravel.dbo.pacchetti as m