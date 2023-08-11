declare variable $rule_instance_path as xs:string external;
let $rule := doc(concat("/srv/basex/db_files/", $rule_instance_path))//rule
let $nsfs :=  doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF/@id
for $r in $rule (: For each rule :)
  for $nsf in $nsfs
  let $capa := doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf]/securityCapability
  let $comp_capa := sum(
    for $r_sec in $r/*/name()
    return if($r_sec != "ruleDescription" and $r_sec != "label") then(
      if(exists(index-of($capa/@ref/data(),
                          concat(upper-case(substring($r_sec, 1, 1)), 
                                 substring($r_sec, 2))))) then (1) else (0))
      else (1))
return if ((count($r/*/name()) = $comp_capa)) 
       then (concat("Rule #ID ", $r/@id/data(), " can be implemented by ", $nsf, " NSF."))
       
       
       
