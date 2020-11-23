# 查询nova 组件服务
nss | sed 's/,//g'|grep -v '+------'|grep -v 'templates'|grep -v -E '^$' |awk -F '|' 'BEGIN {count=0;} {name[count] = $5;count++;}; END{for (i = 0; i < NR; i++) print "echo",name[i] | "/bin/bash"}'

# 获取nova组件服务对外配置项
nss | sed 's/,//g'|grep -v '+------'|grep -v -E '^$'|awk -F '|' 'BEGIN {count=0;} {name[count] = $5;count++;}; END{for (i = 0; i < NR; i++) print "echo",name[i], "&&", " cps template-params-show --service nova ", name[i]|"/bin/bash"}'

# 获取nova组件服务对外配置项,并保存到相应的文件中
nss | sed 's/,//g'|grep -v '+------'|grep -v -E '^$'|awk -F '|' 'BEGIN {count=0;} {name[count] = $5;count++;}; END{for (i = 0; i < NR; i++) print "echo",name[i], "&&", " cps template-params-show --service nova ", name[i],">" ,name[i] |"/bin/bash"}'

# 获取nova组件服务ext对外配置项
nss | sed 's/,//g'|grep -v '+------'|grep -v -E '^$'|awk -F '|' 'BEGIN {count=0;} {name[count] = $5;count++;}; END{for (i = 0; i < NR; i++) print "echo",name[i], "&&", " cps template-ext-params-show --service nova ", name[i]|"/bin/bash"}'
