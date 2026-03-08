insert into reconcileddatalayer.dbo.facilities (id, service, description, supplier, eurocost, eurosale, currency, currencycost, datefrom, dateto, city, nation, area)
select m.servizit_id,
cast(m.servizit_servizi as nvarchar(5)),
m.servizit_desc,
m.servizit_forn,
m.servizit_costoe,
m.servizit_venditae,
case when m.servizit_valuta is not null then cast(m.servizit_valuta as nvarchar(3)) else '' end,
m.servizit_costov,
case when m.servizit_dal is not null then m.servizit_dal else m.servizit_al end,
m.servizit_al,
case when m.servizit_citta is not null then cast(m.servizit_citta as nvarchar(3)) else '' end,
cast(m.servizit_naz as nvarchar(3)),
case when m.servizit_area is not null then cast(m.servizit_area as nvarchar(3)) else '' end
from meridiano.dbo.servizito as m
where m.servizit_al is not null