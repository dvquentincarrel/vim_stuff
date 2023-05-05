iabbrev invisble invisible

function! CommonAbbr()
	" Defines abbrev <buffer>ations useful for the current filetype
	if &filetype == 'bash' || &filetype == 'sh'
		iabbrev <buffer> getopts 
			\while getopts "h" opt; do
			\<cr>case $opt in
			\<cr>h) echo "TODO";;
			\<cr>*) echo "invalid option '$opt'"
			\<cr>	exit 1;;
			\<cr>esac
			\<cr>done
			\<cr>shift $((OPTIND -1))
	elseif &filetype == 'java'
		iabbrev <buffer> sout System.out.println("");<Left><Left><Left>
		iabbrev <buffer> linfo( LOGGER.log(Level.INFO, "");<Left><Left><Left><bs>
		iabbrev <buffer> main( public static void main(String args[]){ 
					\<cr>}
    elseif &filetype == 'twig' || &filetype == 'html.twig'
        inoreabbrev <buffer> path( {{ path('') }}<Esc>4hi
        inoreabbrev <buffer> asset( {{ asset('') }}<Esc>4hi
        inoreabbrev <buffer> trans% {% trans %}{% endtrans %}<Esc>2h%i
    elseif &filetype == 'xml'
        inoreabbrev <buffer> attrs attrs="{'': [('' ,'=', 0)]}"<Esc>18hi
        inoreabbrev <buffer> domain domain="[('', '=', '')]"<Esc>12hi
        inoreabbrev <buffer> mfield <field name="_rc" dynamic_string="global_vars.t_" type="many2one" onchange="" model="" operator="="/>
        inoreabbrev <buffer> qfield <field name="_input" dynamic_string="global_vars.t_" type="float" onchange=""/>
        inoreabbrev <buffer> bfield <field name="_bool" dynamic_string="global_vars.t_" type="boolean"/>
        inoreabbrev <buffer> sfield <field name="_sel" dynamic_string="global_vars.t_" type="localSelection"> 
			\<cr><option value="ok">Ok</option>
			\<cr></field>
        inoreabbrev <buffer> ofield <field name="_ids" dynamic_string="global_vars.t_" type="one2many" onchange="" model="">
			\<cr><label name="id" attrs="{'invisible':1}"/>
			\<cr></field>
		inoreabbrev <buffer> obutton <button dynamic_string="global_vars.t_" onchange=""/>
		inoreabbrev <buffer> fbutton <button dynamic_string="global_vars.t_" type="action" f_to_empty="[]"/>
		inoreabbrev <buffer> tbutton <button dynamic_string="global_vars.t_" type="transition" page=""/>
		inoreabbrev <buffer> pbutton <button string="PDB" onchange="DEBUG_oc_pdb" style="{'background':'coral'}"/>
		elseif &filetype == 'jsp' || &filetype == 'html'
		inoreabbrev <buffer> htmlbase 
			\<html>
			\<cr><head>
			\<cr></head>
			\<cr><body>
			\<cr></body>
			\<cr></html>
	endif
endfunction

