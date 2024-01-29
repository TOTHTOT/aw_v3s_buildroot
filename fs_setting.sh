#/bin/sh

# create depmod related folders
mkdir /lib/modules/5.2.0-licheepi-zero+ -p
# Modify PS1 attributes
# 指定要删除的内容
content_to_delete="if [ "$PS1" ]; then
    if [ "`id -u`" -eq 0 ]; then
        export PS1='# '
    else
        export PS1='$ '
    fi
fi
"

# 指定要追加的内容
content_to_append='export PS1="\[\e[32;1m\][\[\e[33;1m\]\u\[\e[31;1m\]@\[\e[33;1m\]\h \[\e[36;1m\]\w\[\e[32;1m\]]\[\e[34;1m\]\$ \[\e[0m\]"'

# 删除指定内容
# sed -i "/${content_to_delete}/d" /etc/profile

# 追加内容到文件末尾
echo "$content_to_append" >> /etc/profile

mv Start /etc/init.d/

source /etc/profile
