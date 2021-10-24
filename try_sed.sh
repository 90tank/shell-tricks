#!/bin/bash
#
# 主要是对文本行的工具 sed 
# -i 修改源文件 edit inplace
# -e 使用表达式 [ -a 追加 append   4a\ -i 在前面插入 4i\ ]  
# sed '2,5d' 删除2-5行
# sed -n '2,5p' 显示2-5行
##########################################################
echo "I will try sed and conquer it!!"

TESTFILE="testfile.txt";
if [ -e $TESTFILE ];then
  rm -f ./${TESTFILE}
fi

if [ ! -e $TESTFILE ];then
  echo "create ${TESTFILE}"
  touch ${TESTFILE}
fi

cat > ${TESTFILE} <<EOF
    unix is good os, and unix is good
    unix is good
    unix is good also
EOF

echo '----'
cat $TESTFILE

echo '----如果要改變源文件 需要用 -i, 或者重定向到另一個文件'
sed  -i 's/unix/the-unix/1' $TESTFILE
echo '----'
cat $TESTFILE
echo '----'
sed -i 's/unix/windows/g' $TESTFILE
echo '----'
cat $TESTFILE

# 首先要保證有这么多行， 如果源文件没有第4行 ，使用 sed -e 4a 会没有效果 还要带上-i
msg="insert newline by command sed -e 2a"
sed -e 2a\NEWLINE ${TESTFILE} -i
echo "-------"
cat $TESTFILE
echo "-------"
# nl $TESTFILE | sed  '2a insert new line' 
cat $TESTFILE


sed '2,3d' $TESTFILE -i
cat $TESTFILE

echo "======"
nl $TESTFILE | sed -n '2p'
