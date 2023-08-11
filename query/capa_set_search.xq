declare variable $capa_set as xs:string external;
let $nsfs :=  doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF
let $capas := tokenize($capa_set, ",")
let $n_capa := count($capas)
for $nsf in $nsfs 
let $nsf_capa := $nsf/securityCapability/@ref/data()
let $common_capa := sum(
  for $c in $capas 
  return if ($nsf_capa = $c) then (1) else (0)
)
return if($n_capa = $common_capa) 
       then (concat("NSF ", $nsf/@id/data()," supports ", $capa_set))
       