declare variable $nsf_in as xs:string external;
let $capa_list := doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_in]/securityCapability/@ref
let $nsfs :=  doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF/@id
for $nsf in $nsfs (: For each NSF perform the same tasks of two_nsf_comparison.xq :)
  let $n_a := count(doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf]/securityCapability/@ref)
  let $n_b := count($capa_list)
  let $n_common := 
    count(
    for $sec_a in doc("/srv/basex/db_files/NSFCatalogue.xml")//nSF[@id=$nsf_in]/securityCapability/@ref
      for $sec_b in $capa_list
      where $sec_a=$sec_b
      return data($sec_a))
    return if($n_common=$n_a and $n_common=$n_b and $nsf != $nsf_in)
    then(concat(data($nsf),"&#xa;")) 
  