/// fix return value check in {{function}}
///
/// In case of error, the function XXXX() returns ERR_PTR()
/// and never returns NULL. The NULL test in the return value check
/// should be replaced with IS_ERR().
///

virtual content

@r@
expression ret, E;
position p1, p2;
@@
ret = \(__bpf_map_get\|
__clk_create_clk\|
__crypto_alloc_tfm\|
__hci_cmd_sync\|
__hci_cmd_sync_ev\|
__ip_route_output_key\|
__kernfs_create_file\|
__neigh_create\|
__neigh_lookup_errno\|
__scsi_add_device\|
_find_opp_table\|
_install_special_mapping\|
acpi_get_gpiod_by_index\|
ad714x_probe\|
ad7606_probe\|
ad7879_probe\|
addrconf_dst_alloc\|
adxl34x_probe\|
aead_geniv_alloc\|
affs_iget\|
afs_cell_create\|
afs_iget\|
afs_request_key\|
ahash_attr_alg\|
ahci_platform_get_resources\|
aic_common_of_init\|
alloc_anon_inode\|
alloc_file\|
alloc_huge_page\|
alloc_nfs_open_context\|
alloc_ts_config\|
armada_framebuffer_create\|
asymmetric_key_generate_id\|
audit_alloc_mark\|
audit_dupe_rule\|
audit_unpack_string\|
backlight_device_register\|
bfs_iget\|
bio_integrity_alloc\|
bio_map_kern\|
bitmap_create\|
blk_get_request\|
blk_make_request\|
blk_mq_alloc_request\|
blk_mq_init_allocated_queue\|
blk_mq_init_queue\|
blkdev_get_by_dev\|
blkdev_get_by_path\|
blkg_lookup_create\|
bpf_jit_blind_constants\|
bpf_object__open_buffer\|
bpf_prog_get\|
brcmf_add_if\|
brcmf_alloc_vif\|
brcmf_chip_attach\|
btrfs_alloc_dummy_root\|
btrfs_alloc_tree_block\|
btrfs_attach_transaction\|
btrfs_attach_transaction_barrier\|
btrfs_create_tree\|
btrfs_find_create_tree_block\|
btrfs_get_extent\|
btrfs_iget\|
btrfs_join_transaction\|
btrfs_lookup_dentry\|
btrfs_lookup_dir_item\|
btrfs_read_dev_super\|
btrfs_read_fs_root\|
btrfs_read_fs_root_no_name\|
btrfs_ref_to_path\|
btrfs_start_trans_remove_block_group\|
btrfs_start_transaction\|
caam_jr_alloc\|
cache_create_net\|
ccw_device_create_console\|
ceph_alloc_page_vector\|
ceph_create_client\|
ceph_mdsc_build_path\|
ceph_mdsc_create_request\|
ceph_osdc_new_request\|
ceph_parse_options\|
cfs_crypto_hash_init\|
ci_hdrc_add_device\|
cifs_compose_mount_options\|
cifs_get_spnego_key\|
cifs_sb_tlink\|
cl_env_alloc\|
cl_env_get\|
cl_env_nested_get\|
cl_object_find\|
cl_page_find\|
cl_type_setup\|
class_create\|
class_new_export\|
clk_get_sys\|
clk_register_composite\|
clk_register_divider\|
clk_register_divider_table\|
clk_register_fixed_factor\|
clk_register_fixed_rate_with_accuracy\|
clk_register_gate\|
clk_register_mux\|
coda_iget\|
comedi_alloc_board_minor\|
configfs_register_default_group\|
copy_tree\|
core_alloc_hba\|
core_tpg_alloc_lun\|
coresight_register\|
cpufreq_cooling_register\|
cryptd_alloc_ahash\|
crypto_alg_mod_lookup\|
crypto_alloc_ablkcipher\|
crypto_alloc_aead\|
crypto_alloc_ahash\|
crypto_alloc_akcipher\|
crypto_alloc_blkcipher\|
crypto_alloc_cipher\|
crypto_alloc_comp\|
crypto_alloc_instance\|
crypto_alloc_rng\|
crypto_alloc_shash\|
crypto_alloc_skcipher\|
crypto_attr_alg\|
crypto_attr_alg2\|
crypto_attr_alg_name\|
crypto_create_tfm\|
crypto_find_alg\|
crypto_get_attr_alg\|
crypto_get_attr_type\|
crypto_get_default_null_skcipher\|
crypto_larval_alloc\|
crypto_larval_lookup\|
crypto_lookup_skcipher\|
crypto_spawn_aead\|
crypto_spawn_ahash\|
crypto_spawn_blkcipher\|
crypto_spawn_cipher\|
crypto_spawn_shash\|
crypto_spawn_skcipher\|
css_alloc_subchannel\|
css_tryget_online_from_dir\|
ctx_get_frame\|
cyttsp_probe\|
d_absolute_path\|
d_alloc_parallel\|
d_obtain_alias\|
d_obtain_root\|
d_path\|
dasd_alloc_block\|
dasd_device_from_cdev\|
dasd_get_user_string\|
dasd_kmalloc_request\|
dasd_smalloc_request\|
debugfs_create_size_t\|
dentry_open\|
dentry_path_raw\|
dev_pm_opp_find_freq_ceil\|
dev_pm_opp_find_freq_exact\|
dev_pm_opp_find_freq_floor\|
devfreq_add_device\|
devfreq_recommended_opp\|
device_create\|
device_create_with_groups\|
devm_backlight_device_register\|
devm_clk_get\|
devm_clk_register\|
devm_devfreq_event_add_edev\|
devm_extcon_dev_allocate\|
devm_gen_pool_create\|
devm_get_gpiod_from_child\|
devm_gpiod_get\|
devm_gpiod_get_array\|
devm_gpiod_get_index\|
devm_hwmon_device_register_with_groups\|
devm_ioremap_resource\|
devm_lcd_device_register\|
devm_memremap_pages\|
devm_of_phy_get\|
devm_of_phy_get_by_index\|
devm_of_phy_provider_register\|
devm_of_pwm_get\|
devm_phy_create\|
devm_phy_get\|
devm_phy_optional_get\|
devm_pinctrl_get\|
devm_pinctrl_get_select\|
devm_pinctrl_get_select_default\|
devm_pinctrl_register\|
devm_power_supply_register\|
devm_pwm_get\|
devm_regmap_field_alloc\|
devm_regmap_init\|
devm_regmap_init_i2c\|
devm_regmap_init_mmio\|
devm_regmap_init_mmio_clk\|
devm_regmap_init_spi\|
devm_regmap_init_vexpress_config\|
devm_regulator_get_exclusive\|
devm_regulator_get_optional\|
devm_regulator_register\|
devm_reset_control_get\|
devm_reset_control_get_optional\|
devm_reset_control_get_optional_shared\|
devm_reset_control_get_shared\|
devm_reset_control_get_shared_by_index\|
devm_rtc_device_register\|
devm_sigmadsp_init\|
devm_thermal_zone_of_sensor_register\|
devm_usb_get_phy\|
devm_usb_get_phy_by_phandle\|
devm_usb_get_phy_dev\|
dm_block_manager_create\|
dm_bufio_client_create\|
dm_bufio_read\|
dm_io_client_create\|
dm_kcopyd_client_create\|
dma_buf_attach\|
dma_buf_export\|
dma_buf_get\|
dma_buf_map_attachment\|
dma_request_chan\|
dma_request_slave_channel_reason\|
dqget\|
drm_dev_alloc\|
drm_atomic_get_connector_state\|
drm_atomic_get_crtc_state\|
drm_atomic_get_plane_state\|
drm_atomic_helper_duplicate_state\|
drm_atomic_helper_suspend\|
drm_fb_helper_alloc_fbi\|
drm_fbdev_cma_init\|
drm_gem_cma_create\|
drm_gem_get_pages\|
drm_minor_acquire\|
drm_prime_pages_to_sg\|
drm_property_create_blob\|
dsa_resolve_tag_protocol\|
dss_video_pll_init\|
dw_dma_cyclic_prep\|
efs_iget\|
eventfd_ctx_fdget\|
eventfd_ctx_fileget\|
ext4_find_extent\|
ext4_get_crypto_ctx\|
ext4_getblk\|
ext4_iget\|
ext4_journal_start\|
ext4_journal_start_sb\|
ext4_read_block_bitmap\|
ext4_read_block_bitmap_nowait\|
extcon_get_edev_by_phandle\|
exynos_dpi_probe\|
exynos_drm_crtc_create\|
exynos_drm_framebuffer_init\|
exynos_drm_gem_create\|
exynos_drm_gem_get_dma_addr\|
f2fs_iget\|
fault_create_debugfs_attr\|
fib_rules_register\|
fifo_create_dflt\|
file_open_name\|
file_open_root\|
file_path\|
filp_open\|
find_asymmetric_key\|
fixed_phy_register\|
fork_idle\|
frame_vector_pages\|
freeze_bdev\|
freq_reg_info\|
fscrypt_get_ctx\|
fsnotify_alloc_group\|
fuse_get_req\|
fuse_get_req_for_background\|
fw_iso_context_create\|
get_empty_filp\|
get_lock_data_page\|
get_mtd_device\|
get_mtd_device_nm\|
get_net_ns_by_fd\|
get_net_ns_by_pid\|
get_new_data_page\|
get_node_page\|
get_phy_device\|
get_read_data_page\|
get_txreq\|
gether_connect\|
gether_setup_default\|
getname\|
gfs2_inode_lookup\|
gfs2_lookup_by_inum\|
gpiochip_request_own_desc\|
gpiod_get\|
gpiod_get_array\|
gpiod_get_index\|
gpiod_get_optional\|
gru_alloc_gts\|
h4_recv_buf\|
hci_connect_acl\|
hci_connect_le\|
hci_connect_le_scan\|
hdlcdrv_register\|
hfs_bmap_alloc\|
hfs_bnode_create\|
hfs_bnode_find\|
hfsplus_iget\|
hid_allocate_device\|
hugetlb_file_setup\|
hvc_alloc\|
hwmon_device_register\|
hwmon_device_register_with_groups\|
hypfs_create_str\|
hypfs_create_u64\|
hypfs_mkdir\|
i2400m_msg_to_dev\|
i915_gem_context_lookup\|
i915_gem_obj_lookup_or_create_vma\|
i915_gem_object_create\|
i915_gem_object_pin_map\|
i915_gem_request_alloc\|
i915_vma_pin_iomap\|
ib_alloc_cq\|
ib_alloc_fmr\|
ib_alloc_mr\|
ib_alloc_pd\|
ib_create_ah\|
ib_create_ah_from_wc\|
ib_create_cm_id\|
ib_create_cq\|
ib_create_fmr_pool\|
ib_create_qp\|
ib_create_send_mad\|
ib_create_srq\|
ib_fmr_pool_map_phys\|
ib_get_dma_mr\|
ib_register_mad_agent\|
ib_umem_get\|
icmp6_dst_alloc\|
idal_buffer_alloc\|
ieee80211_key_alloc\|
iio_channel_get\|
iio_channel_get_all\|
init_data_container\|
init_inode_metadata\|
init_ipath\|
int340x_thermal_zone_add\|
intel_atomic_get_crtc_state\|
intel_engine_create_ringbuffer\|
iommu_group_alloc\|
iommu_group_get_for_dev\|
ion_device_create\|
ip6_dst_lookup_flow\|
ip6_sk_dst_lookup_flow\|
ip_route_connect\|
ip_route_newports\|
ip_route_output\|
ip_route_output_flow\|
ip_route_output_key\|
ip_route_output_ports\|
ipc_obtain_object_idr\|
ipcctl_pre_down_nolock\|
isofs_iget\|
iw_create_cm_id\|
jffs2_iget\|
jffs2_setup_xattr_datum\|
jffs2_write_dirent\|
jffs2_write_dnode\|
jfs_iget\|
kern_mount\|
kern_mount_data\|
kern_path_create\|
kern_path_locked\|
kernfs_create_dir\|
kernfs_create_link\|
kernfs_create_root\|
key_alloc\|
key_create_or_update\|
key_type_lookup\|
keyring_alloc\|
keyring_search\|
kiblnd_rdma_create_id\|
kthread_create\|
kthread_create_on_node\|
kthread_run\|
lcd_device_register\|
ldc_alloc\|
ldc_alloc_exp_dring\|
ldebugfs_register\|
ll_prep_md_op_data\|
ll_splice_alias\|
lmv_find_target\|
lmv_locate_mds\|
load_msg\|
logfs_iget\|
logfs_new_meta_inode\|
lookup_bdev\|
lookup_free_ino_inode\|
lookup_free_space_inode\|
lookup_one_len\|
lookup_one_len_unlocked\|
lookup_user_key\|
lov_sub_get\|
lp55xx_of_populate_pdata\|
map_mft_record\|
mbox_request_channel\|
mbus_register_device\|
mcb_request_mem\|
mcryptd_alloc_ahash\|
mctrl_gpio_init\|
mctrl_gpio_init_noauto\|
mdiobus_scan\|
mei_cl_alloc_linked\|
memdup_user\|
memdup_user_nul\|
mesh_path_add\|
minix_iget\|
mlx4_alloc_cmd_mailbox\|
mlx5_add_flow_rule\|
mlx5_create_auto_grouped_flow_table\|
mlx5_create_flow_group\|
mlx5_create_flow_table\|
mmc_alloc_card\|
most_register_interface\|
mpol_dup\|
msm_framebuffer_init\|
msm_gem_new\|
msm_gem_vaddr\|
msm_gem_vaddr_locked\|
msm_iommu_new\|
msm_ioremap\|
mthca_alloc_mailbox\|
mthca_alloc_mtt\|
mv_cesa_dma_add_op\|
new_node_page\|
nf_tables_set_lookup\|
nf_tables_set_lookup_byid\|
nfcmrvl_nci_register_dev\|
nfs4_label_alloc\|
nfs_async_rename\|
nfs_create_request\|
nfs_fhget\|
nfs_get_client\|
nfs_get_lock_context\|
nilfs_iget\|
notifier_err_inject_init\|
nouveau_connector_create\|
ntfs_attr_find_vcn_nolock\|
ntfs_attr_iget\|
ntfs_cluster_alloc\|
ntfs_iget\|
ntfs_map_page\|
ntfs_mapping_pairs_decompress\|
ntfs_runlists_merge\|
nvdimm_namespace_common_probe\|
nvdimm_setup_pfn\|
nvme_alloc_request\|
nvmem_cell_get\|
nvmem_register\|
ocfs2_iget\|
ocfs2_start_trans\|
of_clk_get_from_provider\|
of_cpufreq_power_cooling_register\|
of_genpd_get_from_provider\|
of_get_coresight_platform_data\|
of_get_named_gpiod_flags\|
of_io_request_and_map\|
of_reset_control_get\|
omap_device_alloc\|
omap_device_build\|
omap_device_build_ss\|
omap_framebuffer_init\|
omap_voltage_get_voltdata\|
omapdss_of_find_source_for_first_ep\|
omfs_iget\|
onfi_async_timing_mode_to_sdr_timings\|
open_exec\|
orangefs_iget\|
osduld_info_lookup\|
osduld_path_lookup\|
ovl_lookup_temp\|
ovl_path_open\|
ovs_vport_alloc\|
p9_client_attach\|
p9_client_getattr_dotl\|
p9_client_stat\|
p9_client_walk\|
pci_create_slot\|
pci_ecam_create\|
pciserial_init_ports\|
perf_event_create_kernel_counter\|
perf_evsel__newtp\|
phy_connect\|
phy_create\|
pinctrl_get_select\|
pinctrl_lookup_state\|
platform_create_bundle\|
platform_device_register_data\|
platform_device_register_resndata\|
platform_device_register_simple\|
pn533_register_device\|
posix_acl_from_mode\|
power_supply_register\|
power_supply_register_no_ws\|
proc_mem_open\|
proc_ns_fget\|
pseries_of_derive_parent\|
ptp_clock_register\|
pwm_get\|
pwm_lpss_probe\|
pwm_request\|
pwm_request_from_chip\|
qcom_cc_map\|
qcom_smem_get\|
qcom_smem_state_register\|
qdisc_alloc\|
qib_alloc_devdata\|
qib_create_qp0_ah\|
qnx4_iget\|
qnx6_iget\|
radeon_copy_blit\|
radeon_copy_dma\|
raw3270_request_alloc\|
rdma_create_id\|
rds_conn_create\|
read_cache_page\|
read_mapping_page\|
read_tree_block\|
register_user_hw_breakpoint\|
regmap_init\|
regmap_init_ac97\|
regmap_init_i2c\|
regmap_init_mmio\|
regulator_get\|
regulator_get_exclusive\|
regulator_get_optional\|
regulator_register\|
reiserfs_iget\|
request_key\|
request_key_and_link\|
reset_control_get\|
rockchip_clk_init\|
rockchip_gem_create_object\|
root_device_register\|
rpc_bind_new_program\|
rpc_clone_client_set_auth\|
rpc_create\|
rpc_lookup_cred\|
rpc_mkpipe_data\|
rpc_mkpipe_dentry\|
rpc_run_task\|
rpcrdma_alloc_regbuf\|
rpcrdma_create_rep\|
rpcrdma_create_req\|
rqst_exp_find\|
rqst_find_fsidzero_export\|
rtc_device_register\|
rtnl_create_link\|
rtnl_link_get_net\|
s3c_adc_register\|
s3c_cpufreq_clk_get\|
sched_create_group\|
scif_get_peer_dev\|
scif_register_device\|
sdhci_alloc_host\|
sdhci_pltfm_init\|
search_free_space_info\|
search_inode_for_lustre\|
search_my_process_keyrings\|
search_process_keyrings\|
securityfs_create_dir\|
securityfs_create_file\|
sfi_check_table\|
sget\|
sget_userns\|
sh_mobile_meram_cache_alloc\|
shash_alloc_instance\|
shash_attr_alg\|
shmem_file_setup\|
shmem_kernel_file_setup\|
shmem_read_mapping_page\|
simple_transaction_get\|
skb_segment\|
skcipher_geniv_alloc\|
slhc_init\|
smk_import_entry\|
smk_parse_smack\|
snd_soc_new_ac97_codec\|
soc_device_register\|
squashfs_read_table\|
srp_rport_add\|
ssc_request\|
stmmac_probe_config_dt\|
strndup_user\|
svc_prepare_thread\|
syscon_node_to_regmap\|
syscon_regmap_lookup_by_compatible\|
syscon_regmap_lookup_by_pdevname\|
syscon_regmap_lookup_by_phandle\|
sysv_iget\|
tape_alloc_request\|
tape_find_device\|
target_alloc_session\|
tcf_action_init_1\|
tegra_bo_create\|
tegra_bo_create_with_handle\|
textsearch_prepare\|
thermal_cooling_device_register\|
thermal_of_cooling_device_register\|
thermal_zone_device_register\|
thermal_zone_get_zone_by_name\|
thermal_zone_of_sensor_register\|
ti_clk_get_reg_addr\|
tpm_chip_alloc\|
tpmm_chip_alloc\|
trace_event__tp_format\|
tracing_init_dentry\|
transport_init_session\|
tty_alloc_driver\|
tty_port_register_device\|
tty_register_device\|
ubi_open_volume\|
ubifs_change_lp\|
ubifs_get_nnode\|
ubifs_iget\|
ubifs_load_znode\|
ubifs_lpt_lookup\|
ubifs_lpt_lookup_dirty\|
ubifs_new_inode\|
ubifs_read_sb_node\|
ubifs_recover_leb\|
ubifs_scan\|
ubifs_start_scan\|
ubifs_tnc_next_ent\|
udf_find_metadata_inode_efe\|
udf_iget\|
usb_cdc_wdm_register\|
usb_get_function\|
usb_get_function_instance\|
usb_get_phy\|
usb_gstrings_attach\|
usb_phy_generic_register\|
user_path_create\|
v4l2_clk_get\|
v4l2_clk_register\|
v4l2_flash_init\|
v4l2_m2m_ctx_init\|
v4l2_m2m_init\|
v4l2_of_alloc_parse_endpoint\|
v9fs_fid_clone\|
v9fs_fid_lookup\|
v9fs_get_inode\|
v9fs_get_new_inode_from_fid\|
v9fs_vfs_lookup\|
v9fs_writeback_fid\|
vb2_create_framevec\|
vb2_dma_sg_init_ctx\|
vc4_bo_create\|
vc4_ioremap_regs\|
vfs_kern_mount\|
virtio_find_single_vq\|
virtio_gpu_alloc_object\|
vmw_binding_state_alloc\|
vmw_cmdbuf_alloc\|
vmw_kms_new_framebuffer\|
vop_register_device\|
vxfs_get_page\|
vxfs_iget\|
wimax_msg_alloc\|
wl1251_alloc_hw\|
wlcore_alloc_hw\|
x509_cert_parse\|
xenbus_directory\|
xenbus_read\|
xfrm_lookup\|
xt_copy_counters_from_user\|
xt_find_match\|
xt_hook_ops_alloc\|
xt_register_table\|
xt_request_find_match\|
xt_request_find_target\|
zfcp_port_enqueue\)(...)@p1;
... when != ret = E
(
ret@p2 == NULL
|
ret@p2 != NULL
)

@depends on !content@
expression r.ret;
position r.p2;
constant C;
@@
(
if (
- ret@p2 == NULL
+ IS_ERR(ret)
 ) {
  ...
- return -C;
+ return PTR_ERR(ret);
}
|
- ret@p2 == NULL || IS_ERR(ret)
+ IS_ERR(ret)
|
- IS_ERR(ret) || ret@p2 == NULL
+ IS_ERR(ret)
|
- ret@p2 != NULL && !IS_ERR(ret)
+ !IS_ERR(ret)
|
- !IS_ERR(ret) && ret@p2 != NULL
+ !IS_ERR(ret)
|
- ret@p2 == NULL
+ IS_ERR(ret)
|
- ret@p2 != NULL
+ !IS_ERR(ret)
)

@m depends on content@
identifier fn;
position r.p1;
@@

fn(...)@p1

@script:python depends on m && content@
fn << m.fn;
@@

msg = """In case of error, the function %s() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check
should be replaced with IS_ERR()."""

print msg % fn
