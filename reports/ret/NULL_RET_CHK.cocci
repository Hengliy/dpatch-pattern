/// fix return value check in {{function}}
///
/// In case of error, the function XXXX() returns NULL pointer
/// not ERR_PTR(). The IS_ERR() test in the return value check
/// should be replaced with NULL test.
///
@@
expression ret, E;
@@
ret = \(____alloc_ei_netdev\|
__alloc_pages_node\|
__alloc_percpu\|
__alloc_percpu_gfp\|
__arm_ioremap_exec\|
__clk_get_hw\|
__clk_lookup\|
__dev_alloc_skb\|
__dev_get_by_index\|
__dev_get_by_name\|
__genwqe_alloc_consistent\|
__get_free_page\|
__get_free_pages\|
__get_vm_area\|
__getname\|
__in6_dev_get\|
__in_dev_get_rcu\|
__in_dev_get_rtnl\|
__ioremap\|
__ip_dev_find\|
__memblock_alloc_base\|
__netdev_alloc_skb\|
__netdev_alloc_skb_ip_align\|
__page_cache_alloc\|
__pskb_copy\|
__pskb_copy_fclone\|
__scsi_alloc_queue\|
__seq_open_private\|
__skb_dequeue\|
__skb_recv_datagram\|
__vlan_find_dev_deep_rcu\|
__vmalloc\|
_alloc_mISDN_skb\|
aac_fib_alloc\|
acpi_db_convert_to_node\|
acpi_driver_data\|
acpi_ds_create_walk_state\|
acpi_ev_get_gpe_event_info\|
acpi_evaluate_dsm\|
acpi_evaluate_dsm_typed\|
acpi_get_pci_dev\|
acpi_match_device\|
acpi_ns_get_attached_object\|
acpi_ns_get_normalized_pathname\|
acpi_ns_validate_handle\|
acpi_os_allocate\|
acpi_os_ioremap\|
acpi_os_map_iomem\|
acpi_os_map_memory\|
acpi_pci_find_root\|
acpi_ps_alloc_op\|
acpi_ps_create_scope_op\|
acpi_ut_create_buffer_object\|
acpi_ut_create_generic_state\|
acpi_ut_create_integer_object\|
acpi_ut_create_internal_object\|
acpi_ut_create_string_object\|
affs_bread\|
agp_alloc_bridge\|
ahash_request_alloc\|
alloc_apertures\|
alloc_arcdev\|
alloc_can_err_skb\|
alloc_can_skb\|
alloc_candev\|
alloc_canfd_skb\|
alloc_disk\|
alloc_disk_node\|
alloc_ei_netdev\|
alloc_etherdev\|
alloc_etherdev_mq\|
alloc_etherdev_mqs\|
alloc_fddidev\|
alloc_hash_table\|
alloc_hdlcdev\|
alloc_io_pgtable_ops\|
alloc_irdadev\|
alloc_irq_cpu_rmap\|
alloc_mdio_bitbang\|
alloc_mgtxmitframe23a\|
alloc_msi_entry\|
alloc_netdev\|
alloc_netdev_mq\|
alloc_netdev_mqs\|
alloc_ordered_workqueue\|
alloc_orinocodev\|
alloc_page\|
alloc_page_vma\|
alloc_pages\|
alloc_pages_exact\|
alloc_pages_node\|
alloc_percpu\|
alloc_percpu_gfp\|
alloc_sja1000dev\|
alloc_skb\|
alloc_tty_driver\|
alloc_vm_area\|
alloc_workqueue\|
amba_device_alloc\|
amdgpu_ring_alloc\|
amiga_chip_alloc\|
argv_split\|
armada_gem_object_lookup\|
arp_create\|
asd_alloc_coherent\|
ata_host_alloc\|
ata_host_alloc_pinfo\|
ata_qc_from_tag\|
atari_stram_alloc\|
ath10k_wmi_alloc_skb\|
atm_dev_register\|
atomic_read\|
audit_log_start\|
avmcard_dma_alloc\|
b1_alloc_card\|
b53_switch_alloc\|
batadv_find_router\|
batadv_hash_new\|
batadv_neigh_ifinfo_get\|
batadv_neigh_node_new\|
batadv_orig_hash_find\|
batadv_orig_router_get\|
batadv_primary_if_get_selected\|
batadv_seq_print_text_primary_if_get\|
bcom_task_alloc\|
bdget\|
bdget_disk\|
bfa_fcs_fcxp_alloc\|
bfa_fcs_vf_lookup\|
bfa_reqq_next\|
bio_alloc\|
bio_alloc_bioset\|
bio_clone_fast\|
bio_kmalloc\|
bio_list_pop\|
bioset_create\|
blk_alloc_queue\|
blk_alloc_queue_node\|
blk_fetch_request\|
blk_init_queue\|
blk_peek_request\|
bpf_jit_binary_alloc\|
bpf_map_lookup_elem\|
brcmf_get_module_param\|
brcmu_pkt_buf_get_skb\|
break_deleg_wait\|
bsearch\|
bt_skb_alloc\|
bt_skb_send_alloc\|
btrfs_alloc_dummy_fs_info\|
btrfs_alloc_path\|
btrfs_lookup_block_group\|
build_path_from_dentry\|
build_skb\|
bus_find_device\|
bus_find_device_by_name\|
c4iw_get_resource\|
calipso_doi_getdef\|
call_usermodehelper_setup\|
callchain_cursor_current\|
calloc\|
can_create_echo_skb\|
cdev_alloc\|
ceph_alloc_cap_flush\|
ceph_buffer_new\|
ceph_find_inode\|
ceph_msg_new\|
ceph_osdc_alloc_request\|
cfg80211_find_ie\|
cfg80211_get_bss\|
cfg80211_inform_bss\|
cfg80211_testmode_alloc_reply_skb\|
cfpkt_create\|
cfs_hash_create\|
cfs_percpt_alloc\|
check_asic_status\|
chpid_to_chp\|
cifs_convert_path_to_utf16\|
cifs_iget\|
cipso_v4_doi_getdef\|
class_find_device\|
class_name2obd\|
clk_hw_get_parent_by_index\|
clk_prepare_enable\|
clkdev_create\|
clkdm_lookup\|
comedi_8254_init\|
comedi_alloc_devpriv\|
comedi_alloc_spriv\|
compat_alloc_user_space\|
conn_prepare_command\|
copy_to_iter\|
cpqhp_slot_find\|
cpu_map__new\|
create_freezable_workqueue\|
create_singlethread_workqueue\|
create_workqueue\|
crypto_dequeue_request\|
cs5535_mfgpt_alloc_timer\|
cx88_core_get\|
cxgb4_l2t_get\|
d_alloc\|
d_alloc_name\|
d_alloc_pseudo\|
d_find_alias\|
d_inode\|
d_inode_rcu\|
d_lookup\|
d_make_root\|
debug_register\|
dev_alloc_skb\|
dev_get_by_index\|
dev_get_by_index_rcu\|
dev_get_by_name\|
dev_get_by_name_rcu\|
dev_get_drvdata\|
dev_get_platdata\|
dev_get_regmap\|
device_create_file\|
device_find_child\|
devm_iio_device_alloc\|
devm_iio_kfifo_allocate\|
devm_iio_trigger_alloc\|
devm_input_allocate_device\|
devm_input_allocate_polled_device\|
devm_ioport_map\|
devm_ioremap\|
devm_ioremap_nocache\|
devm_ioremap_wc\|
devm_kasprintf\|
devm_kcalloc\|
devm_kmalloc\|
devm_kmalloc_array\|
devm_kmemdup\|
devm_kstrdup\|
devm_kzalloc\|
devm_mdiobus_alloc\|
devm_mdiobus_alloc_size\|
devm_request_irq\|
devm_request_mem_region\|
devres_alloc\|
diReadSpecial\|
dlm_find_lockspace_local\|
dlm_lookup_lockres\|
dlpar_configure_connector\|
dlsym\|
dm_shift_arg\|
dma_alloc_attrs\|
dma_alloc_coherent\|
dma_alloc_from_contiguous\|
dma_alloc_noncoherent\|
dma_alloc_wc\|
dma_get_any_slave_channel\|
dma_map_sg\|
dma_map_single\|
dma_pool_alloc\|
dma_pool_create\|
dma_pool_zalloc\|
dma_request_channel\|
dma_request_slave_channel\|
dma_request_slave_channel_compat\|
dma_zalloc_coherent\|
dmaengine_get_unmap_data\|
dmaengine_prep_dma_cyclic\|
dmaengine_prep_slave_sg\|
dmaengine_prep_slave_single\|
dmam_alloc_coherent\|
dmam_pool_create\|
dmi_get_system_info\|
do_map_probe\|
driver_find_device\|
drm_atomic_state_alloc\|
drm_calloc_large\|
drm_crtc_find\|
drm_cvt_mode\|
drm_dev_alloc\|
drm_encoder_find\|
drm_gem_object_lookup\|
drm_get_edid\|
drm_legacy_findmap\|
drm_legacy_getsarea\|
drm_malloc_ab\|
drm_malloc_gfp\|
drm_mode_create\|
drm_mode_duplicate\|
drm_pci_alloc\|
drm_property_create\|
drm_property_create_enum\|
drm_property_create_range\|
dso__new\|
dst_neigh_lookup\|
dvb_attach\|
dwfl_begin\|
early_memremap\|
ecardm_iomap\|
edac_device_alloc_ctl_info\|
edac_mc_alloc\|
edac_mc_del_mc\|
edac_pci_alloc_ctl_info\|
edac_pci_create_generic_ctl\|
eeh_dev_to_pci_dev\|
eeh_phb_pe_get\|
elevator_alloc\|
elf_begin\|
elf_getdata\|
elf_getscn\|
enable_irq_wake\|
ext2_get_group_desc\|
ext4_get_group_desc\|
ext4_mark_inode_dirty\|
f2fs_grab_cache_page\|
f2fs_kmalloc\|
f2fs_kmem_cache_create\|
fb_ddc_read\|
fb_find_mode\|
fbmem_init\|
fc_attach_transport\|
fc_frame_alloc\|
fc_frame_payload_get\|
fc_remote_port_add\|
fc_vport_create\|
fdopen\|
fdt_getprop\|
fget\|
fgets\|
fib6_get_table\|
find_get_page\|
find_get_pid\|
find_lboard\|
find_lock_page\|
find_lock_task_mm\|
find_node_by_compatible\|
find_or_create_page\|
find_task_by_pid_ns\|
find_task_by_vpid\|
find_vma\|
find_vma_intersection\|
finddevice\|
fl6_sock_lookup\|
flex_array_alloc\|
fopen\|
fops_get\|
fork\|
frame_vector_create\|
framebuffer_alloc\|
fsnotify_find_inode_mark\|
fuse_dev_alloc\|
gen_pool_alloc\|
gen_pool_create\|
gen_pool_get\|
genlmsg_new\|
genlmsg_put\|
genlmsg_put_reply\|
get_cc_state\|
get_cpu_device\|
get_device\|
get_fs_type\|
get_insn_slot\|
get_kprobe\|
get_metapage\|
get_mm_exe_file\|
get_parent\|
get_pid_task\|
get_proc_task\|
get_qhp\|
get_reg_bank\|
get_task_mm\|
get_user\|
get_vm_area\|
get_vm_area_caller\|
get_zeroed_page\|
getenv\|
gfs2_blk2rgrpd\|
gigaset_initcs\|
gigaset_initdriver\|
gpio_direction_output\|
gpio_is_valid\|
gpio_request\|
gpio_to_desc\|
gpiochip_find\|
gpiochip_is_requested\|
grab_cache_page\|
grab_cache_page_write_begin\|
gro_find_receive_by_type\|
groups_alloc\|
hashbin_lock_find\|
hashbin_new\|
hci_alloc_dev\|
hci_conn_add\|
hci_conn_hash_lookup_ba\|
hci_conn_hash_lookup_handle\|
hci_conn_hash_lookup_le\|
hci_conn_params_lookup\|
hci_dev_get\|
hci_find_link_key\|
hci_get_route\|
hci_sent_cmd_data\|
hfi1_rvt_get_rwqe\|
hfs_btree_open\|
hid_alloc_report_buf\|
hid_get_drvdata\|
hisi_clk_init\|
hists__add_entry\|
host1x_syncpt_request\|
hsi_alloc_msg\|
huge_pte_offset\|
hvutil_transport_init\|
i2c_get_adapter\|
i2c_mux_alloc\|
i2c_new_device\|
i2c_new_dummy\|
i2c_smbus_write_byte_data\|
i40iw_get_cqp_request\|
i40iw_sc_cqp_get_next_send_wqe\|
i915_gem_object_alloc\|
i915_gem_object_create_stolen\|
ib_get_client_data\|
ibmasm_new_command\|
ibnl_put_msg\|
ide_host_alloc\|
idr_find\|
ieee80211_alloc_hw\|
ieee80211_beacon_get\|
ieee80211_beacon_get_tim\|
ieee80211_bss_get_ie\|
ieee80211_find_sta\|
ieee80211_find_sta_by_ifaddr\|
ieee80211_get_channel\|
ieee80211_nullfunc_get\|
ieee80211_probereq_get\|
ieee80211_proberesp_get\|
ieee80211_pspoll_get\|
ieee802154_alloc_hw\|
iget5_locked\|
iget_locked\|
igrab\|
iio_alloc_pollfunc\|
iio_kfifo_allocate\|
iio_trigger_alloc\|
il_get_hw_mode\|
ilookup5\|
imx_soc_device_init\|
in6_dev_get\|
in_dev_get\|
inet_reqsk_alloc\|
init_bch\|
init_fsm\|
input_allocate_device\|
input_allocate_polled_device\|
integrity_iint_find\|
intel_connector_alloc\|
intel_th_device_get_resource\|
intlist__new\|
io_mapping_create_wc\|
iommu_domain_alloc\|
iommu_group_get\|
ioport_map\|
ioread32be\|
ioremap\|
ioremap_cache\|
ioremap_nocache\|
ioremap_prot\|
ioremap_wc\|
ip6t_alloc_initial_table\|
ip_dev_find\|
ip_set_alloc\|
ip_tunnel_lookup\|
ip_vs_conn_new\|
ip_vs_create_timeout_table\|
ipc_rcu_alloc\|
ipset_nest_start\|
ipt_alloc_initial_table\|
iriap_open\|
irlap_open\|
irlmp_get_discoveries\|
irlmp_open_lsap\|
irq_alloc_generic_chip\|
irq_alloc_hwirq\|
irq_create_mapping\|
irq_domain_add_hierarchy\|
irq_domain_add_legacy\|
irq_domain_add_linear\|
irq_domain_add_simple\|
irq_domain_add_tree\|
irq_domain_alloc_fwnode\|
irq_domain_create_linear\|
irq_find_host\|
irq_find_mapping\|
irq_get_irq_data\|
irq_of_parse_and_map\|
irq_to_desc\|
irttp_open_tsap\|
iscsi_boot_create_ethernet\|
iscsi_boot_create_initiator\|
iscsi_boot_create_target\|
iscsi_conn_setup\|
iscsi_create_endpoint\|
iscsi_find_param_from_key\|
iscsi_host_alloc\|
iscsi_itt_to_task\|
iscsi_lookup_endpoint\|
iscsi_register_transport\|
iscsi_session_setup\|
iscsit_allocate_cmd\|
iscsit_find_cmd_from_itt\|
iscsit_get_seq_holder\|
isofs_bread\|
iucv_path_alloc\|
iwl_mvm_sta_from_staid_protected\|
jffs2_alloc_raw_inode\|
kallsyms_lookup\|
kasprintf\|
kcalloc\|
kdbgetenv\|
kernfs_new_node\|
key_user_lookup\|
kfd_get_process_device_data\|
kmalloc\|
kmalloc_array\|
kmalloc_node\|
kmap\|
kmap_atomic\|
kmem_alloc\|
kmem_cache_alloc\|
kmem_cache_alloc_node\|
kmem_cache_create\|
kmem_cache_zalloc\|
kmem_zalloc\|
kmem_zalloc_large\|
kmemdup\|
kobject_create_and_add\|
kobject_get\|
kobject_get_path\|
krealloc\|
kset_create_and_add\|
kstrdup\|
kstrdup_const\|
kstrndup\|
kvasprintf\|
kvm_find_cpuid_entry\|
kvm_kvzalloc\|
kzalloc\|
kzalloc_node\|
l1_data_sram_zalloc\|
l1_event\|
l2cap_chan_create\|
l2tp_session_find_nth\|
l2tp_tunnel_find\|
large_malloc\|
lbs_add_card\|
ldlm_resource_get\|
le16_to_cpu\|
lib80211_get_crypto_ops\|
libcfs_kvzalloc\|
libfc_host_alloc\|
list_empty\|
list_first_entry_or_null\|
list_get_first\|
llc_sap_open\|
load_nls\|
locks_alloc_lock\|
lookup_address\|
lookup_extent_mapping\|
lpfc_enable_node\|
lpfc_mbuf_alloc\|
lpfc_sli_get_iocbq\|
lprocfs_alloc_stats\|
lustre_msg_buf\|
lwtunnel_state_alloc\|
m5mols_set_mode\|
m5mols_write\|
mI_alloc_skb\|
machine__findnew_dso\|
machine__findnew_thread\|
machine__new_host\|
map__new2\|
map_groups__find\|
match_strdup\|
md_register_thread\|
mdesc_get_property\|
mdesc_grab\|
mdiobus_alloc\|
mdiobus_alloc_size\|
mdiobus_get_phy\|
media_entity_remote_pad\|
mei_cl_alloc_cb\|
mei_io_cb_init\|
memblock_alloc\|
memblock_find_in_range\|
memchr\|
memcmp\|
memdup\|
memparse\|
mempool_alloc\|
mempool_create\|
mempool_create_kmalloc_pool\|
mempool_create_page_pool\|
mempool_create_slab_pool\|
memremap\|
memstick_alloc_host\|
memstick_next_req\|
metadata_dst_alloc\|
mfd_add_devices\|
mite_alloc_ring\|
mite_attach\|
mlx4_cmd_imm\|
mlx5_get_flow_namespace\|
mlx5_vzalloc\|
mm_find_pmd\|
mmc_alloc_host\|
module_alloc\|
mpc5xxx_get_bus_frequency\|
mpi_alloc\|
mpi_alloc_limb_space\|
mpi_read_raw_data\|
mpic_alloc\|
mpt3sas_base_get_smid\|
mtd_concat_create\|
mtd_device_register\|
mthca_array_get\|
mwifiex_alloc_dma_align_buf\|
mwifiex_get_priv_by_id\|
mwifiex_get_sta_entry\|
napi_alloc_skb\|
napi_get_frags\|
nci_allocate_device\|
nci_get_conn_info_by_conn_id\|
nci_skb_alloc\|
neigh_parms_alloc\|
nes_get_cqp_request\|
netdev_alloc_frag\|
netdev_alloc_pcpu_stats\|
netdev_alloc_skb\|
netdev_alloc_skb_ip_align\|
netlink_kernel_create\|
new_inode\|
next_net_device_rcu\|
next_request\|
nf_conntrack_find_get\|
nf_ct_alloc_hashtable\|
nf_ct_expect_alloc\|
nf_ct_ext_add\|
nf_ct_get\|
nf_ct_helper_ext_add\|
nf_ct_nat_ext_add\|
nf_ct_tmpl_alloc\|
nf_get_id\|
nfc_alloc_recv_skb\|
nfc_allocate_device\|
nfc_digital_allocate_device\|
nfc_get_device\|
nfc_get_local_general_bytes\|
nfc_hci_allocate_device\|
nfc_llcp_find_local\|
nfct_help\|
nfs4_find_get_deviceid\|
nfs_alloc_fattr\|
nla_nest_start\|
nla_reserve\|
nla_reserve_64bit\|
nla_reserve_nohdr\|
nlm_alloc_call\|
nlmsg_find_attr\|
nlmsg_new\|
nlmsg_put\|
nouveau_bo_pin\|
ntfs_malloc_nofs\|
nvbios_dpcfg_match\|
nvbios_dpout_match\|
nvbios_rd16\|
nvkm_i2c_bus_find\|
o2nm_get_node_by_num\|
ocfs2_get_system_file_inode\|
ocfs2_new_path_from_et\|
of_clk_get_parent_count\|
of_clk_get_parent_name\|
of_cpu_device_node_get\|
of_device_get_match_data\|
of_drm_find_bridge\|
of_drm_find_panel\|
of_find_backlight_by_node\|
of_find_compatible_node\|
of_find_device_by_node\|
of_find_i2c_adapter_by_node\|
of_find_i2c_device_by_node\|
of_find_matching_node\|
of_find_matching_node_and_match\|
of_find_node_by_name\|
of_find_node_by_path\|
of_find_node_by_phandle\|
of_find_node_by_type\|
of_find_property\|
of_gen_pool_get\|
of_get_address\|
of_get_child_by_name\|
of_get_cpu_node\|
of_get_display_timings\|
of_get_flat_dt_prop\|
of_get_i2c_adapter_by_node\|
of_get_mac_address\|
of_get_next_available_child\|
of_get_next_child\|
of_get_next_parent\|
of_get_parent\|
of_get_pci_address\|
of_get_property\|
of_get_regulator_init_data\|
of_graph_get_endpoint_by_regs\|
of_graph_get_next_endpoint\|
of_graph_get_port_by_id\|
of_graph_get_remote_port\|
of_graph_get_remote_port_parent\|
of_iomap\|
of_ioremap\|
of_match_device\|
of_match_node\|
of_mdio_find_bus\|
of_node_get\|
of_parse_phandle\|
of_phy_connect\|
of_phy_find_device\|
of_platform_device_create\|
of_prop_next_u32\|
of_property_read_bool\|
of_property_read_u32\|
of_property_read_u32_array\|
omap4iss_video_buffer_next\|
omap_dss_find_output\|
omap_dss_get_overlay_manager\|
omap_hwmod_lookup\|
omapdss_of_get_first_endpoint\|
omapdss_of_get_next_endpoint\|
omapdss_of_get_next_port\|
omfs_bread\|
op_alloc\|
opendir\|
p54_init_common\|
page_check_address\|
page_mapping\|
pagevec_lookup\|
parport_find_base\|
parport_pc_probe_port\|
parport_register_dev_model\|
parport_register_device\|
parport_register_port\|
parse_options_subcommand\|
pci_add_new_bus\|
pci_alloc_consistent\|
pci_alloc_dev\|
pci_bus_to_host\|
pci_create_root_bus\|
pci_device_to_OF_node\|
pci_enable_msi\|
pci_find_bus\|
pci_find_capability\|
pci_find_ext_capability\|
pci_get_bus_and_slot\|
pci_get_device\|
pci_get_domain_bus_and_slot\|
pci_get_drvdata\|
pci_get_slot\|
pci_get_subsys\|
pci_iomap\|
pci_iomap_wc\|
pci_ioremap_bar\|
pci_ioremap_wc_bar\|
pci_map_rom\|
pci_msi_create_irq_domain\|
pci_pool_alloc\|
pci_pool_create\|
pci_resource_len\|
pci_resource_start\|
pci_scan_bus\|
pci_scan_root_bus\|
pci_scan_single_device\|
pci_set_dma_mask\|
pci_zalloc_consistent\|
pcibios_alloc_controller\|
pcim_iomap\|
pcim_iomap_table\|
pcmcia_register_socket\|
pcpu_alloc_alloc_info\|
per_cpu\|
perf_aux_output_begin\|
perf_evlist__find_tracepoint_by_name\|
perf_evlist__id2evsel\|
perf_evlist__new\|
perf_evsel__new\|
perf_session__new\|
perf_trace_buf_alloc\|
pevent_find_any_field\|
phy_find_first\|
pi_register_driver\|
pid_task\|
pin_desc_get\|
platform_device_alloc\|
platform_get_device_id\|
platform_get_drvdata\|
platform_get_irq\|
platform_get_resource\|
platform_get_resource_byname\|
pmd_alloc\|
pnp_alloc_dev\|
pnp_register_card_driver\|
pnp_register_driver\|
pnp_request_card_device\|
popen\|
posix_acl_alloc\|
power_supply_get_by_name\|
pps_register_source\|
prepare_creds\|
prepare_kernel_cred\|
prism2_init_local_data\|
probe_irq_off\|
proc_create\|
proc_create_data\|
proc_mkdir\|
proc_net_mkdir\|
proc_pid_make_inode\|
prom_getenv\|
psb_intel_i2c_create\|
pskb_copy\|
pte_alloc_kernel\|
pte_alloc_map\|
pte_offset_map\|
pte_page\|
ptlrpc_prep_bulk_imp\|
ptlrpc_prep_set\|
ptlrpc_request_alloc\|
ptlrpc_request_alloc_pack\|
ptlrpc_request_cache_alloc\|
pud_alloc\|
put_user\|
pwrdm_lookup\|
pxa_ssp_request\|
qdisc_class_find\|
qdisc_create_dflt\|
qed_ptt_acquire\|
qed_rd\|
qeth_get_ipacmd_buffer\|
qib_get_rwqe\|
qla2x00_alloc_fcport\|
qla2x00_get_sp\|
qla4xxx_lookup_ddb_by_fw_index\|
qlcnic_issue_cmd\|
queueptr\|
quicklist_alloc\|
r8712_alloc_stainfo\|
r8712_get_stainfo\|
radix_tree_delete\|
radix_tree_lookup\|
rb_entry\|
rb_first\|
rb_next\|
rb_prev\|
rc_allocate_device\|
rcar_du_format_info\|
rcu_access_pointer\|
rcu_dereference_bh\|
rcu_dereference_raw\|
rcu_dereference_sched\|
rcu_dereference_sk_user_data\|
rds_message_alloc_sgs\|
read_metapage\|
read_part_sector\|
readl_relaxed\|
realloc\|
realpath\|
register_filesystem\|
register_net_sysctl\|
register_snap_client\|
register_sysctl_table\|
regmap_update_bits\|
regmap_write\|
remove_vm_area\|
req_capsule_client_get\|
req_capsule_server_get\|
req_capsule_server_sized_get\|
request_firmware\|
request_irq\|
request_mem_region\|
request_module\|
request_region\|
resource_list_create_entry\|
rfkill_alloc\|
ring_buffer_alloc\|
rpc_d_lookup_sb\|
rproc_alloc\|
rproc_da_to_va\|
rtnl_dereference\|
rtw_alloc_stainfo\|
rtw_alloc_stainfo23a\|
rtw_get_bcmc_stainfo\|
rtw_get_bcmc_stainfo23a\|
rtw_get_stainfo\|
rtw_get_stainfo23a\|
rvt_create_mmap_info\|
rvt_lookup_qpn\|
samsung_clk_alloc_reg_dump\|
sas_alloc_slow_task\|
sas_attach_transport\|
sas_domain_attach_transport\|
sas_end_device_alloc\|
sas_phy_alloc\|
sb_bread\|
sb_getblk\|
sc_alloc\|
schedule_timeout\|
scsi_bios_ptable\|
scsi_device_lookup\|
scsi_host_alloc\|
scsi_host_find_tag\|
scsi_host_lookup\|
scsi_register\|
sctp_assoc_lookup_paddr\|
sctp_get_af_specific\|
scu_a9_get_base\|
search_exception_tables\|
setup_fake_machine\|
setup_machine_fdt\|
sg_next\|
sh_clk_div4_register\|
sh_clk_div6_register\|
shmob_drm_format_info\|
simple_strtoul\|
sk_alloc\|
skb_clone\|
skb_copy\|
skb_copy_expand\|
skb_dequeue\|
skb_header_pointer\|
skb_peek\|
skb_peek_tail\|
skb_realloc_headroom\|
skb_recv_datagram\|
skb_share_check\|
skb_unshare\|
skcipher_request_alloc\|
snd_array_new\|
snd_card_register\|
snd_ctl_find_id\|
snd_ctl_make_virtual_master\|
snd_ctl_new1\|
snd_hda_codec_pcm_new\|
snd_info_create_card_entry\|
snd_info_create_module_entry\|
snd_lookup_minor_data\|
snd_lookup_oss_minor_data\|
snd_midi_channel_alloc_set\|
snd_soc_dai_get_dma_data\|
snd_usb_find_csint_desc\|
snd_util_memhdr_new\|
snic_req_init\|
soc_camera_xlate_by_fourcc\|
soc_mbus_config_compatible\|
soc_mbus_get_fmtdesc\|
sock_alloc_send_pskb\|
sock_alloc_send_skb\|
sock_dequeue_err_skb\|
sock_kmalloc\|
sock_wmalloc\|
sockfd_lookup\|
spi_alloc_master\|
spi_attach_transport\|
spi_get_ctldata\|
sst_acpi_find_machine\|
sst_create_block\|
sta_info_alloc\|
sta_info_get\|
sta_info_get_bss\|
strchr\|
strdup\|
strlist__new\|
strndup\|
strpbrk\|
strrchr\|
strsep\|
strstr\|
strtok_r\|
svnic_dev_get_res\|
symbol__new\|
symbol_get\|
symbol_request\|
t3_l2t_get\|
t4_alloc_mem\|
target_nacl_find_deve\|
tcp_slow_start\|
tegra_clk_init\|
tegra_lookup_dt_id\|
test_and_set_bit\|
thread_map__new\|
tipc_buf_acquire\|
to_amdgpu_connector\|
tomoyo_encode\|
tomoyo_get_name\|
trace_buffer_lock_reserve\|
tracefs_create_dir\|
tracefs_create_file\|
transport_kmap_data_sg\|
try_then_request_module\|
tty_get_baud_rate\|
tty_ldisc_ref\|
tty_port_tty_get\|
ubi_get_device\|
ubi_zalloc_vid_hdr\|
udev_device_get_sysattr_value\|
udev_device_new_from_subsystem_sysname\|
udf_fileident_read\|
udf_tread\|
udl_gem_alloc_object\|
udl_get_urb\|
uml_kmalloc\|
usb_alloc_coherent\|
usb_alloc_dev\|
usb_alloc_urb\|
usb_altnum_to_altsetting\|
usb_autopm_get_interface\|
usb_create_hcd\|
usb_create_shared_hcd\|
usb_ep_alloc_request\|
usb_ep_autoconfig\|
usb_find_interface\|
usb_get_dev\|
usb_get_from_anchor\|
usb_get_intfdata\|
usb_get_serial_port_data\|
usb_hub_find_child\|
usb_ifnum_to_if\|
usb_maxpacket\|
usb_otg_descriptor_alloc\|
usbip_alloc_iso_desc_pdu\|
user_regset_copyin\|
user_regset_copyout\|
uwb_ie_next\|
v4l2_ctrl_find\|
v4l2_i2c_new_subdev\|
v4l2_i2c_new_subdev_board\|
v4l2_m2m_get_curr_priv\|
v4l2_m2m_get_vq\|
v4l2_subdev_alloc_pad_config\|
v4l2_subdev_call\|
va_arg\|
vb2_dvb_get_frontend\|
vchan_find_desc\|
vchan_next_desc\|
versatile_clcd_get_panel\|
video_device_alloc\|
virtqueue_get_buf\|
vm_normal_page\|
vmalloc\|
vmalloc_32\|
vmalloc_node\|
vmalloc_to_page\|
vmalloc_user\|
vmap\|
vmemmap_pgd_populate\|
vmemmap_pud_populate\|
vmw_fifo_reserve\|
vmw_fifo_reserve_dx\|
vnic_dev_get_res\|
vnic_dev_register\|
voltdm_lookup\|
vring_create_virtqueue\|
vring_new_virtqueue\|
vsp1_entity_get_pad_config\|
vzalloc\|
vzalloc_node\|
wait_event_interruptible\|
wait_event_interruptible_timeout\|
wait_event_timeout\|
wait_for_completion_interruptible\|
wait_for_completion_interruptible_timeout\|
wait_for_completion_timeout\|
wakeup_source_register\|
wf_get_mpu\|
wimax_dev_get_by_genl_info\|
wiphy_new\|
x86_match_cpu\|
xdr_inline_decode\|
xdr_reserve_space\|
xfrm_ip2inner_mode\|
xfrm_state_alloc\|
xfrm_state_lookup\|
xfs_trans_get_buf\|
xhci_alloc_command\|
xprt_alloc\|
xprt_lookup_rqst\|
xt_alloc_table_info\|
xt_replace_table\|
xz_dec_init\|
zalloc\|
zalloc_maybe_bootmem\|
zcrypt_device_alloc\|
zfcp_get_port_by_wwpn\)(...);
... when != ret = E
(
- IS_ERR(ret)
+ !ret
|
- !IS_ERR(ret)
+ ret
)