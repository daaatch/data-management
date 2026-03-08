UPDATE tgt
SET
    tgt.phone      = CASE
                        WHEN h.hotel_tel IS NOT NULL AND h.hotel_tel <> '' THEN CAST(h.hotel_tel AS NVARCHAR(13))
                        WHEN h.hotel_cellulare IS NOT NULL AND h.hotel_cellulare <> '' THEN CAST(h.hotel_cellulare AS NVARCHAR(13))
                        ELSE NULL
                     END,
    tgt.email      = CASE WHEN h.hotel_email IS NULL OR h.hotel_email = '' THEN NULL ELSE CAST(h.hotel_email AS NVARCHAR(50)) END
FROM ReconciledDataLayer.dbo.Hotels tgt
JOIN Meridiano.dbo.HOTEL h
    ON tgt.id = CONCAT('M-', h.hotel_key)
WHERE h.hotel_cit IS NOT NULL;