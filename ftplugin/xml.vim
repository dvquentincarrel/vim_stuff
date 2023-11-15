setlocal foldmethod=indent
setlocal shiftwidth=4
setlocal tabstop=4
let b:altmakeprg='silent !dataer inject'

nmap <buffer> <leader># I<!-- <C-o>$ --><esc><<
vmap <buffer> <leader># <esc>'<O<!--<esc>'>o--><esc>

inoreabbrev <buffer> iattrs attrs="{'invisible': [('_%%%%_', '=', _%%%%_)]}"<esc>
inoreabbrev <buffer> attrs attrs="{'_%%%%_': [('_%%%%_', '=', 0)]}"
inoreabbrev <buffer> domain domain="[('_%%%%_', '=', '_%%%%_')]"

inoreabbrev <buffer> mfield <field name="_%%%%__rc" string="global_labels._%%%%_" type="many2one" onchange="_%%%%_" model="_%%%%_"/>
inoreabbrev <buffer> qfield <field name="_%%%%__input" string="global_labels._%%%%_" type="float" onchange="_%%%%_"/>
inoreabbrev <buffer> cfield <field name="_%%%%__input" string="global_labels._%%%%_" type="char" onchange="_%%%%_"/>
inoreabbrev <buffer> bfield <field name="_%%%%__bool" string="global_labels._%%%%_" type="boolean"/>
inoreabbrev <buffer> sfield <field name="_%%%%__sel" string="global_labels._%%%%_" type="localSelection"> 
\<cr><option value="ok">Ok</option>
\<cr></field>
inoreabbrev <buffer> ofield <field name="_%%%%__ids" string="global_labels._%%%%_" type="one2many" onchange="_%%%%_" model="_%%%%_">
\<cr><label name="id" attrs="{'invisible':1}"/>
\<cr></field>

inoreabbrev <buffer> obutton <button string="global_labels._%%%%_" onchange="_%%%%_"/>
inoreabbrev <buffer> fbutton <button string="global_labels._%%%%_" type="action" f_to_empty="[_%%%%_]"/>
inoreabbrev <buffer> tbutton <button string="global_labels._%%%%_" type="transition" page="_%%%%_"/>
inoreabbrev <buffer> pbutton <button string="PDB" onchange="DEBUG_oc_pdb" style="{'background':'coral'}"/>

inoreabbrev <buffer> lbloption <record id="_%%%%_" model="ir.ui.menu.ionic.label">
\<cr><field name="name">_%%%%_</field>
\<cr><field name="ionic_menu_id" eval="ref('_%%%%_')"/>
\<cr><field name="value">_%%%%_</field>
\<cr></record>
inoreabbrev <buffer> paramoption <record id="_%%%%_" model="ir.ui.menu.ionic.param">
\<cr><field name="name">_%%%%_</field>
\<cr><field name="ionic_menu_id" eval="ref('_%%%%_')"/>
\<cr><field name="value">_%%%%_</field>
\<cr><field name="note">_%%%%_</field>
\<cr></record>
