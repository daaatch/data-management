insert into ReconciledDataLayer.dbo.Hotels (id, code, name, address, postalcode, city, province, region, nation, area, category, currency, phone, email, insertdate)
select
	cast(concat('C-', h.hotel_key) as nvarchar(50)),
	cast(h.hotel_key as nvarchar(50)),
	h.hotel_des,
	h.hotel_ind,
	case when h.hotel_cap = '' then NULL else cast(h.hotel_cap as nvarchar(10)) end,
	cast(h.hotel_cit as nvarchar(3)),
	case when h.hotel_pr = '' then NULL else cast(h.hotel_pr as nvarchar(2)) end,
	case when h.hotel_regione = '' then NULL else cast(h.hotel_regione as nvarchar(3)) end,
	cast(h.hotel_naz as nvarchar(3)),
	cast(h.hotel_area as nvarchar(3)),
	case when (h.hotel_cat = '' or h.hotel_cat is not NULL) then NULL else cast(h.hotel_cat as nvarchar(7)) end,
	case when h.hotel_val = '' then NULL else cast(h.hotel_val as nvarchar(3)) end,
	case when not (h.hotel_tel = '' or h.hotel_tel is not NULL) then cast(h.hotel_tel as nvarchar(13)) else case when (h.hotel_cellulare = '' or h.hotel_cellulare = NULL) then NULL else cast(h.hotel_cellulare as nvarchar(13)) end end,
	case when (h.hotel_email = '' or h.hotel_email is not NULL) then NULL else cast(h.hotel_email as nvarchar(50)) end,
	h.hotel_datains
from [ContiTravel].[dbo].[HOTEL] as h
where h.hotel_cit is not null
