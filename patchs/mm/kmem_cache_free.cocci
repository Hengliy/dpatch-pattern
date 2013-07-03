/// use kmem_cache_free() instead of kfree()
///
/// Except File: mm/slab.c : special case that can not detect correctly
/// Except File: drivers/gpu/drm/exynos/exynos_drm_gem.c : special case that can not detect correctly
/// Except File: arch/x86/platform/efi/efi_64.c : special case that can not detect correctly
/// Except File: arch/s390/kvm/kvm-s390.c : special case that can not detect correctly
/// Except File: arch/arm/kvm/mmu.c : special case that can not detect correctly
/// Except File: arch/mips/kvm/kvm_mips.c : special case that can not detect correctly
/// Except File: fs/btrfs/qgroup.c : special case that can not detect correctly
/// Except File: fs/lockd/svclock.c : special case that can not detect correctly
///
/// memory allocated by kmem_cache_alloc() should be freed using
/// kmem_cache_free(), not kfree().
///
@@
struct nsproxy *x;
@@
- kfree(x);
+ kmem_cache_free(nsproxy_cachep, x);

@@
struct k_itimer *x;
@@
- kfree(x);
+ kmem_cache_free(posix_timers_cache, x);

@@
struct pool_workqueue *x;
@@
- kfree(x);
+ kmem_cache_free(pwq_cache, x);

@@
struct taskstats *x;
@@
- kfree(x);
+ kmem_cache_free(taskstats_cache, x);

@@
struct user_namespace *x;
@@
- kfree(x);
+ kmem_cache_free(user_ns_cachep, x);

@@
struct ftrace_event_field *x;
@@
- kfree(x);
+ kmem_cache_free(field_cachep, x);

@@
struct ftrace_event_file *x;
@@
- kfree(x);
+ kmem_cache_free(file_cachep, x);

@@
struct sighand_struct *x;
@@
- kfree(x);
+ kmem_cache_free(sighand_cachep, x);

@@
struct signal_struct *x;
@@
- kfree(x);
+ kmem_cache_free(signal_cachep, x);

@@
struct pid_namespace *x;
@@
- kfree(x);
+ kmem_cache_free(pid_ns_cachep, x);

@@
struct cred *x;
@@
- kfree(x);
+ kmem_cache_free(cred_jar, x);

@@
struct mqueue_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(mqueue_inode_cachep, x);

@@
struct kvm_async_pf *x;
@@
- kfree(x);
+ kmem_cache_free(async_pf_cache, x);

@@
struct file *x;
@@
- kfree(x);
+ kmem_cache_free(filp_cachep, x);

@@
struct sysfs_dirent *x;
@@
- kfree(x);
+ kmem_cache_free(sysfs_dir_cachep, x);

@@
struct qnx6_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(qnx6_inode_cachep, x);

@@
struct logfs_inode *x;
@@
- kfree(x);
+ kmem_cache_free(logfs_inode_cache, x);

@@
struct kiocb *x;
@@
- kfree(x);
+ kmem_cache_free(kiocb_cachep, x);

@@
struct kioctx *x;
@@
- kfree(x);
+ kmem_cache_free(kioctx_cachep, x);

@@
struct gfs2_quota_data *x;
@@
- kfree(x);
+ kmem_cache_free(gfs2_quotad_cachep, x);

@@
struct gfs2_bufdata *x;
@@
- kfree(x);
+ kmem_cache_free(gfs2_bufdata_cachep, x);

@@
struct gfs2_rgrpd *x;
@@
- kfree(x);
+ kmem_cache_free(gfs2_rgrpd_cachep, x);

@@
struct gfs2_glock *x;
@@
- kfree(x);
+ kmem_cache_free(cachep, x);

@@
struct gfs2_inode *x;
@@
- kfree(x);
+ kmem_cache_free(gfs2_inode_cachep, x);

@@
struct files_struct *x;
@@
- kfree(x);
+ kmem_cache_free(files_cachep, x);

@@
struct inode_entry *x;
@@
- kfree(x);
+ kmem_cache_free(winode_slab, x);

@@
struct f2fs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(f2fs_inode_cachep, x);

@@
struct free_nid *x;
@@
- kfree(x);
+ kmem_cache_free(free_nid_slab, x);

@@
struct nat_entry *x;
@@
- kfree(x);
+ kmem_cache_free(nat_entry_slab, x);

@@
struct dir_inode_entry *x;
@@
- kfree(x);
+ kmem_cache_free(inode_entry_slab, x);

@@
struct orphan_inode_entry *x;
@@
- kfree(x);
+ kmem_cache_free(orphan_entry_slab, x);

@@
struct btrfs_trans_handle *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_trans_handle_cachep, x);

@@
struct btrfs_transaction *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_transaction_cachep, x);

@@
struct inode_defrag *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_inode_defrag_cachep, x);

@@
struct btrfs_delayed_node *x;
@@
- kfree(x);
+ kmem_cache_free(delayed_node_cache, x);

@@
struct btrfs_delalloc_work *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_delalloc_work_cachep, x);

@@
struct btrfs_inode *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_inode_cachep, x);

@@
struct btrfs_delayed_data_ref *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_delayed_data_ref_cachep, x);

@@
struct btrfs_delayed_ref_head *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_delayed_ref_head_cachep, x);

@@
struct btrfs_delayed_tree_ref *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_delayed_tree_ref_cachep, x);

@@
struct extent_map *x;
@@
- kfree(x);
+ kmem_cache_free(extent_map_cache, x);

@@
struct btrfs_ordered_extent *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_ordered_extent_cache, x);

@@
struct btrfs_path *x;
@@
- kfree(x);
+ kmem_cache_free(btrfs_path_cachep, x);

@@
struct extent_buffer *x;
@@
- kfree(x);
+ kmem_cache_free(extent_buffer_cache, x);

@@
struct extent_state *x;
@@
- kfree(x);
+ kmem_cache_free(extent_state_cache, x);

@@
struct dlm_lkb *x;
@@
- kfree(x);
+ kmem_cache_free(lkb_cache, x);

@@
struct dlm_rsb *x;
@@
- kfree(x);
+ kmem_cache_free(rsb_cache, x);

@@
struct connection *x;
@@
- kfree(x);
+ kmem_cache_free(con_cache, x);

@@
struct ext4_io_page *x;
@@
- kfree(x);
+ kmem_cache_free(io_page_cachep, x);

@@
ext4_io_end_t *x;
@@
- kfree(x);
+ kmem_cache_free(io_end_cachep, x);

@@
struct ext4_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(ext4_inode_cachep, x);

@@
struct extent_status *x;
@@
- kfree(x);
+ kmem_cache_free(ext4_es_cachep, x);

@@
struct file_lock *x;
@@
- kfree(x);
+ kmem_cache_free(filelock_cache, x);

@@
struct romfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(romfs_inode_cachep, x);

@@
struct dentry *x;
@@
- kfree(x);
+ kmem_cache_free(dentry_cache, x);

@@
struct coda_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(coda_inode_cachep, x);

@@
struct jbd_revoke_record_s *x;
@@
- kfree(x);
+ kmem_cache_free(revoke_record_cache, x);

@@
struct jbd_revoke_table_s *x;
@@
- kfree(x);
+ kmem_cache_free(revoke_table_cache, x);

@@
struct journal_head *x;
@@
- kfree(x);
+ kmem_cache_free(journal_head_cache, x);

@@
struct configfs_dirent *x;
@@
- kfree(x);
+ kmem_cache_free(configfs_dir_cachep, x);

@@
struct affs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(affs_inode_cachep, x);

@@
struct jfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(jfs_inode_cachep, x);

@@
struct exofs_i_info *x;
@@
- kfree(x);
+ kmem_cache_free(exofs_inode_cachep, x);

@@
struct hfsplus_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(hfsplus_inode_cachep, x);

@@
struct ceph_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(ceph_inode_cachep, x);

@@
struct ceph_dentry_info *x;
@@
- kfree(x);
+ kmem_cache_free(ceph_dentry_cachep, x);

@@
struct hfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(hfs_inode_cachep, x);

@@
struct ubifs_inode *x;
@@
- kfree(x);
+ kmem_cache_free(ubifs_inode_slab, x);

@@
struct qnx4_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(qnx4_inode_cachep, x);

@@
struct mount *x;
@@
- kfree(x);
+ kmem_cache_free(mnt_cache, x);

@@
struct fs_struct *x;
@@
- kfree(x);
+ kmem_cache_free(fs_cachep, x);

@@
struct ecryptfs_dentry_info *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_dentry_info_cache, x);

@@
struct ecryptfs_sb_info *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_sb_info_cache, x);

@@
struct ecryptfs_file_info *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_file_info_cache, x);

@@
struct ecryptfs_key_tfm *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_key_tfm_cache, x);

@@
struct ecryptfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_inode_info_cache, x);

@@
struct ecryptfs_auth_tok_list_item *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_auth_tok_list_item_cache, x);

@@
struct ecryptfs_global_auth_tok *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_global_auth_tok_cache, x);

@@
struct ecryptfs_key_record *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_key_record_cache, x);

@@
struct ecryptfs_key_sig *x;
@@
- kfree(x);
+ kmem_cache_free(ecryptfs_key_sig_cache, x);

@@
struct cachefiles_object *x;
@@
- kfree(x);
+ kmem_cache_free(cachefiles_object_jar, x);

@@
struct buffer_head *x;
@@
- kfree(x);
+ kmem_cache_free(bh_cachep, x);

@@
struct jffs2_full_dnode *x;
@@
- kfree(x);
+ kmem_cache_free(full_dnode_slab, x);

@@
struct jffs2_inode_cache *x;
@@
- kfree(x);
+ kmem_cache_free(inode_cache_slab, x);

@@
struct jffs2_node_frag *x;
@@
- kfree(x);
+ kmem_cache_free(node_frag_slab, x);

@@
struct jffs2_raw_dirent *x;
@@
- kfree(x);
+ kmem_cache_free(raw_dirent_slab, x);

@@
struct jffs2_raw_inode *x;
@@
- kfree(x);
+ kmem_cache_free(raw_inode_slab, x);

@@
struct jffs2_raw_node_ref *x;
@@
- kfree(x);
+ kmem_cache_free(raw_node_ref_slab, x);

@@
struct jffs2_tmp_dnode_info *x;
@@
- kfree(x);
+ kmem_cache_free(tmp_dnode_info_slab, x);

@@
struct jffs2_xattr_datum *x;
@@
- kfree(x);
+ kmem_cache_free(xattr_datum_cache, x);

@@
struct jffs2_xattr_ref *x;
@@
- kfree(x);
+ kmem_cache_free(xattr_ref_cache, x);

@@
struct jffs2_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(jffs2_inode_cachep, x);

@@
struct bfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(bfs_inode_cachep, x);

@@
struct op_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(op_inode_cachep, x);

@@
struct fscache_cookie *x;
@@
- kfree(x);
+ kmem_cache_free(fscache_cookie_jar, x);

@@
struct iso_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(isofs_inode_cachep, x);

@@
struct ext3_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(ext3_inode_cachep, x);

@@
struct msdos_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(fat_inode_cachep, x);

@@
struct nilfs_btree_path *x;
@@
- kfree(x);
+ kmem_cache_free(nilfs_btree_path_cache, x);

@@
struct nilfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(nilfs_inode_cachep, x);

@@
struct nilfs_segment_buffer *x;
@@
- kfree(x);
+ kmem_cache_free(nilfs_segbuf_cachep, x);

@@
struct nfs_page *x;
@@
- kfree(x);
+ kmem_cache_free(nfs_page_cachep, x);

@@
struct nfs_direct_req *x;
@@
- kfree(x);
+ kmem_cache_free(nfs_direct_cachep, x);

@@
struct nfs_read_header *x;
@@
- kfree(x);
+ kmem_cache_free(nfs_rdata_cachep, x);

@@
struct udf_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(udf_inode_cachep, x);

@@
struct fuse_req *x;
@@
- kfree(x);
+ kmem_cache_free(fuse_req_cachep, x);

@@
struct inode *x;
@@
- kfree(x);
+ kmem_cache_free(fuse_inode_cachep, x);

@@
struct dnotify_mark *x;
@@
- kfree(x);
+ kmem_cache_free(dnotify_mark_cache, x);

@@
struct dnotify_struct *x;
@@
- kfree(x);
+ kmem_cache_free(dnotify_struct_cache, x);

@@
struct fanotify_response_event *x;
@@
- kfree(x);
+ kmem_cache_free(fanotify_response_event_cache, x);

@@
struct inotify_event_private_data *x;
@@
- kfree(x);
+ kmem_cache_free(event_priv_cachep, x);

@@
struct inotify_inode_mark *x;
@@
- kfree(x);
+ kmem_cache_free(inotify_inode_mark_cachep, x);

@@
struct fsnotify_event *x;
@@
- kfree(x);
+ kmem_cache_free(fsnotify_event_cachep, x);

@@
struct sysv_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(sysv_inode_cachep, x);

@@
struct cifsInodeInfo *x;
@@
- kfree(x);
+ kmem_cache_free(cifs_inode_cachep, x);

@@
ntfs_inode *x;
@@
- kfree(x);
+ kmem_cache_free(ntfs_big_inode_cache, x);

@@
ntfs_attr_search_ctx *x;
@@
- kfree(x);
+ kmem_cache_free(ntfs_attr_ctx_cache, x);

@@
ntfs_index_context *x;
@@
- kfree(x);
+ kmem_cache_free(ntfs_index_ctx_cache, x);

@@
struct nfs4_stateowner *x;
@@
- kfree(x);
+ kmem_cache_free(slab, x);

@@
struct nfs4_stid *x;
@@
- kfree(x);
+ kmem_cache_free(slab, x);

@@
struct svc_cacherep *x;
@@
- kfree(x);
+ kmem_cache_free(drc_slab, x);

@@
struct jbd2_revoke_record_s *x;
@@
- kfree(x);
+ kmem_cache_free(jbd2_revoke_record_cache, x);

@@
struct jbd2_revoke_table_s *x;
@@
- kfree(x);
+ kmem_cache_free(jbd2_revoke_table_cache, x);

@@
struct afs_vnode *x;
@@
- kfree(x);
+ kmem_cache_free(afs_inode_cachep, x);

@@
struct squashfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(squashfs_inode_cachep, x);

@@
struct hugetlbfs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(hugetlbfs_inode_cachep, x);

@@
struct dcookie_struct *x;
@@
- kfree(x);
+ kmem_cache_free(dcookie_cache, x);

@@
struct bdev_inode *x;
@@
- kfree(x);
+ kmem_cache_free(bdev_cachep, x);

@@
struct dlm_lock *x;
@@
- kfree(x);
+ kmem_cache_free(dlm_lock_cache, x);

@@
struct ocfs2_quota_chunk *x;
@@
- kfree(x);
+ kmem_cache_free(ocfs2_qf_chunk_cachep, x);

@@
struct ocfs2_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(ocfs2_inode_cachep, x);

@@
struct dlmfs_inode_private *x;
@@
- kfree(x);
+ kmem_cache_free(dlmfs_inode_cache, x);

@@
struct ocfs2_dquot *x;
@@
- kfree(x);
+ kmem_cache_free(ocfs2_dquot_cachep, x);

@@
struct ocfs2_meta_cache_item *x;
@@
- kfree(x);
+ kmem_cache_free(ocfs2_uptodate_cachep, x);

@@
struct net *x;
@@
- kfree(x);
+ kmem_cache_free(net_cachep, x);

@@
struct cgw_job *x;
@@
- kfree(x);
+ kmem_cache_free(cgw_cache, x);

@@
struct receiver *x;
@@
- kfree(x);
+ kmem_cache_free(rcv_cache, x);

@@
struct sec_path *x;
@@
- kfree(x);
+ kmem_cache_free(secpath_cachep, x);

@@
struct rds_tcp_connection *x;
@@
- kfree(x);
+ kmem_cache_free(rds_tcp_conn_slab, x);

@@
struct rds_connection *x;
@@
- kfree(x);
+ kmem_cache_free(rds_conn_slab, x);

@@
struct ip_vs_conn *x;
@@
- kfree(x);
+ kmem_cache_free(ip_vs_conn_cachep, x);

@@
struct nf_conntrack_expect *x;
@@
- kfree(x);
+ kmem_cache_free(nf_ct_expect_cachep, x);

@@
struct net_bridge_fdb_entry *x;
@@
- kfree(x);
+ kmem_cache_free(br_fdb_cache, x);

@@
struct tfrc_tx_hist_entry *x;
@@
- kfree(x);
+ kmem_cache_free(tfrc_tx_hist_slab, x);

@@
struct dccp_ackvec *x;
@@
- kfree(x);
+ kmem_cache_free(dccp_ackvec_slab, x);

@@
struct dccp_ackvec_record *x;
@@
- kfree(x);
+ kmem_cache_free(dccp_ackvec_record_slab, x);

@@
struct sctp_chunk *x;
@@
- kfree(x);
+ kmem_cache_free(sctp_chunk_cachep, x);

@@
struct sctp_bind_bucket *x;
@@
- kfree(x);
+ kmem_cache_free(sctp_bucket_cachep, x);

@@
struct rxrpc_call *x;
@@
- kfree(x);
+ kmem_cache_free(rxrpc_call_jar, x);

@@
struct inet_bind_bucket *x;
@@
- kfree(x);
+ kmem_cache_free(cachep, x);

@@
struct mfc_cache *x;
@@
- kfree(x);
+ kmem_cache_free(mrt_cachep, x);

@@
struct sw_flow *x;
@@
- kfree(x);
+ kmem_cache_free(flow_cache, x);

@@
struct fib6_node *x;
@@
- kfree(x);
+ kmem_cache_free(fib6_node_kmem, x);

@@
struct mfc6_cache *x;
@@
- kfree(x);
+ kmem_cache_free(mrt_cachep, x);

@@
struct queue_item *x;
@@
- kfree(x);
+ kmem_cache_free(tipc_queue_item_cache, x);

@@
struct socket_alloc *x;
@@
- kfree(x);
+ kmem_cache_free(sock_inode_cachep, x);

@@
struct rmc_entry *x;
@@
- kfree(x);
+ kmem_cache_free(rm_cache, x);

@@
struct integrity_iint_cache *x;
@@
- kfree(x);
+ kmem_cache_free(iint_cache, x);

@@
struct key *x;
@@
- kfree(x);
+ kmem_cache_free(key_jar, x);

@@
struct avc_node *x;
@@
- kfree(x);
+ kmem_cache_free(avc_node_cachep, x);

@@
struct avtab_node *x;
@@
- kfree(x);
+ kmem_cache_free(avtab_node_cachep, x);

@@
struct inode_security_struct *x;
@@
- kfree(x);
+ kmem_cache_free(sel_inode_cache, x);

@@
struct io_context *x;
@@
- kfree(x);
+ kmem_cache_free(iocontext_cachep, x);

@@
struct bsg_command *x;
@@
- kfree(x);
+ kmem_cache_free(bsg_cmd_cachep, x);

@@
struct request_queue *x;
@@
- kfree(x);
+ kmem_cache_free(blk_requestq_cachep, x);

@@
struct idr_layer *x;
@@
- kfree(x);
+ kmem_cache_free(idr_layer_cache, x);

@@
struct s3c2410_dma_buf *x;
@@
- kfree(x);
+ kmem_cache_free(dma_kmem, x);

@@
struct kvm_vcpu *x;
@@
- kfree(x);
+ kmem_cache_free(kvm_vcpu_cache, x);

@@
struct tsb *x;
@@
- kfree(x);
+ kmem_cache_free(tsb_caches [ new_cache_index ], x);

@@
pgd_t *x;
@@
- kfree(x);
+ kmem_cache_free(pgd_cache, x);

@@
struct kvmppc_vcpu_e500 *x;
@@
- kfree(x);
+ kmem_cache_free(kvm_vcpu_cache, x);

@@
struct kvmppc_vcpu_44x *x;
@@
- kfree(x);
+ kmem_cache_free(kvm_vcpu_cache, x);

@@
struct hpte_cache *x;
@@
- kfree(x);
+ kmem_cache_free(hpte_cache, x);

@@
pte_t *x;
@@
- kfree(x);
+ kmem_cache_free(cachep, x);

@@
struct spufs_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(spufs_inode_cache, x);

@@
struct dtl_entry *x;
@@
- kfree(x);
+ kmem_cache_free(dtl_cache, x);

@@
struct sq_mapping *x;
@@
- kfree(x);
+ kmem_cache_free(sq_cache, x);

@@
struct vm_area_struct *x;
@@
- kfree(x);
+ kmem_cache_free(vm_area_cachep, x);

@@
struct vcpu_vmx *x;
@@
- kfree(x);
+ kmem_cache_free(kvm_vcpu_cache, x);

@@
struct vcpu_svm *x;
@@
- kfree(x);
+ kmem_cache_free(kvm_vcpu_cache, x);

@@
struct kmem_cache *x;
@@
- kfree(x);
+ kmem_cache_free(kmem_cache, x);

@@
struct mempolicy *x;
@@
- kfree(x);
+ kmem_cache_free(policy_cache, x);

@@
struct sp_node *x;
@@
- kfree(x);
+ kmem_cache_free(sn_cache, x);

@@
struct rmap_item *x;
@@
- kfree(x);
+ kmem_cache_free(rmap_item_cache, x);

@@
struct kmemleak_object *x;
@@
- kfree(x);
+ kmem_cache_free(object_cache, x);

@@
struct kmemleak_scan_area *x;
@@
- kfree(x);
+ kmem_cache_free(scan_area_cache, x);

@@
struct anon_vma *x;
@@
- kfree(x);
+ kmem_cache_free(anon_vma_cachep, x);

@@
struct kmem_cache_node *x;
@@
- kfree(x);
+ kmem_cache_free(kmem_cache_node, x);

@@
struct shmem_inode_info *x;
@@
- kfree(x);
+ kmem_cache_free(shmem_inode_cachep, x);

@@
struct qeth_qdio_out_buffer *x;
@@
- kfree(x);
+ kmem_cache_free(qeth_qdio_outbuf_cache, x);

@@
struct zfcp_fc_req *x;
@@
- kfree(x);
+ kmem_cache_free(zfcp_fc_req_cache, x);

@@
struct isert_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(isert_cmd_cache, x);

@@
struct iser_tx_desc *x;
@@
- kfree(x);
+ kmem_cache_free(ig . desc_cache, x);

@@
struct ehca_av *x;
@@
- kfree(x);
+ kmem_cache_free(av_cache, x);

@@
struct ehca_mr *x;
@@
- kfree(x);
+ kmem_cache_free(mr_cache, x);

@@
struct ehca_mw *x;
@@
- kfree(x);
+ kmem_cache_free(mw_cache, x);

@@
struct ehca_pd *x;
@@
- kfree(x);
+ kmem_cache_free(pd_cache, x);

@@
struct isp1760_qh *x;
@@
- kfree(x);
+ kmem_cache_free(qh_cachep, x);

@@
struct isp1760_qtd *x;
@@
- kfree(x);
+ kmem_cache_free(qtd_cachep, x);

@@
struct stub_priv *x;
@@
- kfree(x);
+ kmem_cache_free(stub_priv_cache, x);

@@
struct fwtty_transaction *x;
@@
- kfree(x);
+ kmem_cache_free(fwtty_txn_cache, x);

@@
struct flushlist_node *x;
@@
- kfree(x);
+ kmem_cache_free(ramster_flnode_cache, x);

@@
struct ashmem_area *x;
@@
- kfree(x);
+ kmem_cache_free(ashmem_area_cachep, x);

@@
struct ashmem_range *x;
@@
- kfree(x);
+ kmem_cache_free(ashmem_range_cachep, x);

@@
struct fwnet_packet_task *x;
@@
- kfree(x);
+ kmem_cache_free(fwnet_packet_task_cache, x);

@@
struct se_session *x;
@@
- kfree(x);
+ kmem_cache_free(se_sess_cache, x);

@@
struct tcm_loop_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(tcm_loop_cmd_cache, x);

@@
struct iscsi_datain_req *x;
@@
- kfree(x);
+ kmem_cache_free(lio_dr_cache, x);

@@
struct iscsi_ooo_cmdsn *x;
@@
- kfree(x);
+ kmem_cache_free(lio_ooo_cache, x);

@@
struct iscsi_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(lio_cmd_cache, x);

@@
struct iscsi_queue_req *x;
@@
- kfree(x);
+ kmem_cache_free(lio_qr_cache, x);

@@
struct iscsi_r2t *x;
@@
- kfree(x);
+ kmem_cache_free(lio_r2t_cache, x);

@@
struct se_ua *x;
@@
- kfree(x);
+ kmem_cache_free(se_ua_cache, x);

@@
struct t10_alua_lu_gp *x;
@@
- kfree(x);
+ kmem_cache_free(t10_alua_lu_gp_cache, x);

@@
struct t10_alua_lu_gp_member *x;
@@
- kfree(x);
+ kmem_cache_free(t10_alua_lu_gp_mem_cache, x);

@@
struct t10_alua_tg_pt_gp *x;
@@
- kfree(x);
+ kmem_cache_free(t10_alua_tg_pt_gp_cache, x);

@@
struct t10_alua_tg_pt_gp_member *x;
@@
- kfree(x);
+ kmem_cache_free(t10_alua_tg_pt_gp_mem_cache, x);

@@
struct t10_pr_registration *x;
@@
- kfree(x);
+ kmem_cache_free(t10_pr_reg_cache, x);

@@
struct ioat_ring_ent *x;
@@
- kfree(x);
+ kmem_cache_free(ioat2_cache, x);

@@
struct xen_blkif *x;
@@
- kfree(x);
+ kmem_cache_free(xen_blkif_cachep, x);

@@
struct rsxx_bio_meta *x;
@@
- kfree(x);
+ kmem_cache_free(bio_meta_pool, x);

@@
struct rsxx_dma *x;
@@
- kfree(x);
+ kmem_cache_free(rsxx_dma_pool, x);

@@
struct creg_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(creg_cmd_pool, x);

@@
struct qla_tgt_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(qla_tgt_cmd_cachep, x);

@@
struct asd_ascb *x;
@@
- kfree(x);
+ kmem_cache_free(asd_ascb_cache, x);

@@
struct scsi_data_buffer *x;
@@
- kfree(x);
+ kmem_cache_free(scsi_sdb_cache, x);

@@
struct scsi_tgt_cmd *x;
@@
- kfree(x);
+ kmem_cache_free(scsi_tgt_cmd_cache, x);

@@
struct mvs_task_list *x;
@@
- kfree(x);
+ kmem_cache_free(mvs_task_list_cache, x);

@@
struct sas_task *x;
@@
- kfree(x);
+ kmem_cache_free(sas_task_cache, x);

@@
struct dm_uevent *x;
@@
- kfree(x);
+ kmem_cache_free(_dm_event_cache, x);

@@
struct entry *x;
@@
- kfree(x);
+ kmem_cache_free(mq_entry_cache, x);

@@
struct dm_exception *x;
@@
- kfree(x);
+ kmem_cache_free(exception_cache, x);
