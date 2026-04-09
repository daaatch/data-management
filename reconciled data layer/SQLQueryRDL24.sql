insert into reconcileddatalayer.dbo.bundles (code, description)
select cast(src.soggiorno_cod as nvarchar(3)), cast(src.soggiorno_des as nvarchar(50))
from meridiano.dbo.soggiorno as src