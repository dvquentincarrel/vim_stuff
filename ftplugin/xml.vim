setlocal foldmethod=indent
let b:altmakeprg='silent !dataer inject'

nmap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vmap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>

inoreabbrev <buffer> iattrs attrs="{'invisible': [('<%%%%>', '=', <%%%%>)]}"<esc>
inoreabbrev <buffer> attrs attrs="{'<%%%%>': [('<%%%%>', '=', 0)]}"
inoreabbrev <buffer> domain domain="[('<%%%%>', '=', '<%%%%>')]"

inoreabbrev <buffer> mfield <field name="<%%%%>_rc" string="global_labels.<%%%%>" type="many2one" onchange="<%%%%>" model="<%%%%>"/>
inoreabbrev <buffer> qfield <field name="<%%%%>_input" string="global_labels.<%%%%>" type="float" onchange="<%%%%>"/>
inoreabbrev <buffer> cfield <field name="<%%%%>_input" string="global_labels.<%%%%>" type="char" onchange="<%%%%>"/>
inoreabbrev <buffer> bfield <field name="<%%%%>_bool" string="global_labels.<%%%%>" type="boolean"/>
inoreabbrev <buffer> sfield <field name="<%%%%>_sel" string="global_labels.<%%%%>" type="localSelection"> 
\<cr><option value="ok">Ok</option>
\<cr></field>
inoreabbrev <buffer> ofield <field name="<%%%%>_ids" string="global_labels.<%%%%>" type="one2many" onchange="<%%%%>" model="<%%%%>">
\<cr><label name="id" attrs="{'invisible':1}"/>
\<cr></field>

inoreabbrev <buffer> obutton <button string="global_labels.<%%%%>" onchange="<%%%%>"/>
inoreabbrev <buffer> fbutton <button string="global_labels.<%%%%>" type="action" f_to_empty="[<%%%%>]"/>
inoreabbrev <buffer> tbutton <button string="global_labels.<%%%%>" type="transition" page="<%%%%>"/>
inoreabbrev <buffer> pbutton <button string="PDB" onchange="DEBUG_oc_pdb" style="{'background':'coral'}"/>

inoreabbrev <buffer> lbloption <record id="<%%%%>" model="ir.ui.menu.ionic.label">
\<cr><field name="name"><%%%%></field>
\<cr><field name="ionic_menu_id" eval="ref('<%%%%>')"/>
\<cr><field name="value"><%%%%></field>
\<cr></record>
inoreabbrev <buffer> paramoption <record id="<%%%%>" model="ir.ui.menu.ionic.param">
\<cr><field name="name"><%%%%></field>
\<cr><field name="ionic_menu_id" eval="ref('<%%%%>')"/>
\<cr><field name="value"><%%%%></field>
\<cr><field name="note"><%%%%></field>
\<cr></record>
