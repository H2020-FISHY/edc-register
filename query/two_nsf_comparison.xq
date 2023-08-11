declare variable $nsf_a as xs:string external;
declare variable $nsf_b as xs:string external;
(let $a :=0
return ("Common SecurityCapability = ", array{
  (: Iterate the two securityCapability lists :)
  for $sec_a in doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_a]/securityCapability/@ref
  for $sec_b in doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_b]/securityCapability/@ref
  where $sec_a=$sec_b (: Return only securityCapability that is in both lists :)
  return data($sec_a)
}, "&#xa;",
let $n_a := count(doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_a]/securityCapability/@ref)
let $n_b := count(doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_b]/securityCapability/@ref)
let $n_common := (: Count common securityCapability :)
  count(for $sec_a in doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_a]/securityCapability/@ref
  for $sec_b in doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_b]/securityCapability/@ref
  where $sec_a=$sec_b
  return data($sec_a))
  (: See if condition to understand how inclusion and equality is defined  :)
   return if($n_common=$n_a and $n_common=$n_b)
             then(concat("NSF ", $nsf_a, " and ", $nsf_b, " are equivalent.&#xa;"))else 
         if($n_b != 0 and $n_common=$n_b and $n_a > $n_b) 
             then (concat("NSF ", $nsf_a, " includes NSF", $nsf_b, ".&#xa;")) else 
         if($n_a != 0 and $n_common=$n_a and $n_a < $n_b) 
             then (concat("NSF ",$nsf_b," includes NSF ", $nsf_a,".&#xa;")) else 
         if($n_common = 0) then ("NSF A and NSF B do not have SecurityCapabilities in common.&#xa;")
))