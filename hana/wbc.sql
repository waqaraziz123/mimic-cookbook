-- # 15.	White Blood Cell Count Histogram

select bucket/10, count(*) from (
   	select width_bucket("le"."VALUENUM", 0, 100, 1001) as bucket
   	from "MIMIC2V26"."labevents" "le", "MIMIC2V26"."d_patients" "dp"
   	where "ITEMID" in (50316, 50468) and "le"."VALUENUM" is not null and "le"."SUBJECT_ID" = "dp"."SUBJECT_ID" and months_between("dp"."DOB", "le"."CHARTTIME")/12 > 15)
group by bucket order by bucket;

