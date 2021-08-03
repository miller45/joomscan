#start registration
dprint("Contact form finder");
my $vul_url1="/en/?option=com_contact&view=contact&id=1";
my $vul_url2="/en/component/contact/contact/4-uncategorised/1?Itemid=131";
my $source=$ua->get("$target$vul_url1")->decoded_content;
#$source=$ua->get("$target/en/contact/contact/4-uncategorised/1?Itemid=131")->decoded_content;
if($source =~ /div class="contact" / ){
	tprint("There is at least one contact accessible...are you aware of it\n$target$vul_url1"); #///index.php?option=com_users&view=registration"
}
if ($source =~ /jform_contact_email_copy-lbl/g) {
	tprint("Copy to yourself (Send Copy to Submitter) is enabled this can be abused for spam\n$target$vul_url1"); #///index.php?option=com_users&view=registration"
}
$source=$ua->get("$target$vul_url2")->decoded_content;
if($source =~ /div class="contact" / ){
	tprint("A contact form can be listed via another obscure url:\n$target$vul_url2");
}
if ($source =~ /jform_contact_email_copy-lbl/g) {
	tprint("Copy to yourself (Send Copy to Submitter) is enabled this can be abused for spam\n$target$vul_url2"); #///index.php?option=com_users&view=registration"
}
#end registration