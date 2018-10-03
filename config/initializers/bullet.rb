# # white list
# Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Category', association: :articles
# #
# # # 使っていないeager_loadingを許容する
# Bullet.add_whitelist type: :unused_eager_loading, class_name: 'Category', association: :articles
# #
# Bullet.add_whitelist type: :counter_cache, class_name: "Category", association: :articles
