
-- Ini buat track berapa jumlah pengisi pada setiap bulan
SELECT
    TO_CHAR(DATE_TRUNC('month', sf.created_at), 'Month, YYYY') AS bulan,
    COUNT(sf.filler_id) AS total_pengisi_bulanan
FROM 
    survey_fillers sf
JOIN 
    surveys s ON sf.survey_id = s.id
WHERE 
    EXTRACT(YEAR FROM sf.created_at) <= EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY 
    TO_CHAR(DATE_TRUNC('month', sf.created_at), 'Month, YYYY')
ORDER BY 
    MIN(sf.created_at);

-- Ini buat track siapa aja yang isi di bulan tertentu   
SELECT 
    sf.filler_id,
    u.full_name,
    sf.created_at
FROM 
    survey_fillers sf
JOIN 
    users u ON sf.filler_id = u.id
WHERE 
    DATE_TRUNC('month', sf.created_at) = '2021-11-01'::date
AND
    EXTRACT(YEAR FROM sf.created_at) = 2021
AND
    EXTRACT(MONTH FROM sf.created_at) = 11;

   
SELECT
    u.id AS user,
    COUNT(sw.winner_id) AS total_winner,
    COUNT(sf.survey_id) AS total_survey_diisi,
    CASE
        WHEN COUNT(sf.survey_id) > 0 THEN CAST(COUNT(sw.winner_id) AS FLOAT) / COUNT(sf.survey_id)
        ELSE 0
    END AS probability
FROM
    users u
LEFT JOIN
    survey_fillers sf ON u.id = sf.filler_id
LEFT JOIN
    survey_winners sw ON sf.survey_id = sw.survey_id AND u.id = sw.winner_id
GROUP BY
    u.id; 

SELECT 
    u.id AS filler_id,
    u.full_name,
    u.count_filled_survey AS jumlah_survey_diisi,
    s.count_winner AS jumlah_pemenang,
    CASE
        WHEN u.count_filled_survey > 0 THEN CAST(s.count_winner AS FLOAT) / u.count_filled_survey * 100
        ELSE 0
    END AS kemungkinan_menang
FROM 
    users u
LEFT JOIN 
    surveys s ON u.id = s.host_id
    

SELECT
    u.id AS filler_id,
    u.full_name,
    SUM(u.count_filled_survey) AS total_jumlah_survey_diisi,
    SUM(s.count_winner) AS total_jumlah_pemenang,
    CASE
        WHEN SUM(u.count_filled_survey) > 0 THEN CAST(SUM(s.count_winner) AS FLOAT) / SUM(u.count_filled_survey) * 100
        ELSE 0
    END AS kemungkinan_menang
FROM 
    users u
LEFT JOIN 
    surveys s ON u.id = s.host_id
GROUP BY 
    u.id, u.full_name
    
    
 
    
select s.title as  "Judul Survey", 
       u.full_name AS "Pembuat", 
       s.created_at AS "Tanggal Pembuatan", 
       s.reward AS "Hadiah", 
       s.count_winner AS "Jumlah Pemenang",
       count(sf.filler_id) "Jumlah yang Mengisi"
from surveys s
JOIN users u ON s.host_id = u.id
LEFT JOIN survey_fillers sf ON s.id = sf.survey_id
GROUP BY s.title, u.full_name, s.created_at, s.reward, s.count_winner;




SELECT COUNT(sf.filler_id) AS "Total Responden"
FROM surveys s
LEFT JOIN survey_fillers sf ON s.id = sf.survey_id

SELECT SUM(s.count_winner) AS "Total Jumlah Pemenang"
FROM surveys s;

select * from surveys



WITH TotalRespondents AS (
    SELECT COUNT(sf.filler_id) AS "TotalResponden"
    FROM surveys s
    LEFT JOIN survey_fillers sf ON s.id = sf.survey_id
),
TotalWinners AS (
    SELECT SUM(s.count_winner) AS "TotalPemenang"
    FROM surveys s
)
SELECT 
    TR."TotalResponden", 
    TW."TotalPemenang",
    CASE 
        WHEN TW."TotalPemenang" = 0 THEN 0
        ELSE TR."TotalResponden" * 1.0 / TW."TotalPemenang"
    END AS "Rasio Responden per Pemenang"
FROM TotalRespondents TR, TotalWinners TW;


select u.full_name as creator_name, s.*
from surveys s
join users u on s.host_id = u.id
where s.record_link is not null;



SELECT COUNT(title) 
FROM surveys 
WHERE record_link IS NULL;
