#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "12+4 IPs, 4 nodes, multiple transitions"

export CTDB_TEST_LOGLEVEL=0

set -e

echo "Node 3 stopped -> continue node 3, all healthy"

required_result <<EOF
130.216.30.181 2
130.216.30.180 3
130.216.30.179 2
130.216.30.178 1
130.216.30.177 3
130.216.30.176 0
130.216.30.175 1
130.216.30.174 0
130.216.30.173 3
130.216.30.172 2
130.216.30.171 1
130.216.30.170 0
10.19.99.253 1
10.19.99.252 3
10.19.99.251 2
10.19.99.250 0
EOF

simple_test 0,0,0,0 <<EOF
10.19.99.250 0
10.19.99.251 2
10.19.99.252 0
10.19.99.253 1
130.216.30.170 0
130.216.30.171 1
130.216.30.172 2
130.216.30.173 2
130.216.30.174 0
130.216.30.175 1
130.216.30.176 0
130.216.30.177 0
130.216.30.178 1
130.216.30.179 2
130.216.30.180 1
130.216.30.181 2
EOF

echo "All healthy -> stop node 0"

required_result <<EOF
130.216.30.181 2
130.216.30.180 3
130.216.30.179 2
130.216.30.178 1
130.216.30.177 3
130.216.30.176 1
130.216.30.175 1
130.216.30.174 3
130.216.30.173 3
130.216.30.172 2
130.216.30.171 1
130.216.30.170 2
10.19.99.253 1
10.19.99.252 3
10.19.99.251 2
10.19.99.250 1
EOF

simple_test 0x20,0,0,0 <<EOF
$_out
EOF

echo "Continue node 0, all healthy"

required_result <<EOF
130.216.30.181 0
130.216.30.180 3
130.216.30.179 2
130.216.30.178 0
130.216.30.177 3
130.216.30.176 1
130.216.30.175 1
130.216.30.174 0
130.216.30.173 3
130.216.30.172 2
130.216.30.171 1
130.216.30.170 2
10.19.99.253 0
10.19.99.252 3
10.19.99.251 2
10.19.99.250 1
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> stop node 1"

required_result <<EOF
130.216.30.181 0
130.216.30.180 3
130.216.30.179 2
130.216.30.178 0
130.216.30.177 3
130.216.30.176 2
130.216.30.175 0
130.216.30.174 0
130.216.30.173 3
130.216.30.172 2
130.216.30.171 3
130.216.30.170 2
10.19.99.253 0
10.19.99.252 3
10.19.99.251 2
10.19.99.250 0
EOF

simple_test 0,0x20,0,0 <<EOF
$_out
EOF

echo "Continue node 1, all healthy"

required_result <<EOF
130.216.30.181 0
130.216.30.180 1
130.216.30.179 1
130.216.30.178 0
130.216.30.177 3
130.216.30.176 2
130.216.30.175 1
130.216.30.174 0
130.216.30.173 3
130.216.30.172 2
130.216.30.171 3
130.216.30.170 2
10.19.99.253 1
10.19.99.252 3
10.19.99.251 2
10.19.99.250 0
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> Stop node 2"

required_result <<EOF
130.216.30.181 0
130.216.30.180 1
130.216.30.179 1
130.216.30.178 0
130.216.30.177 3
130.216.30.176 3
130.216.30.175 1
130.216.30.174 0
130.216.30.173 3
130.216.30.172 1
130.216.30.171 3
130.216.30.170 0
10.19.99.253 1
10.19.99.252 3
10.19.99.251 1
10.19.99.250 0
EOF

simple_test 0,0,0x20,0 <<EOF
$_out
EOF

echo "Continue node 2, all healthy"

required_result <<EOF
130.216.30.181 2
130.216.30.180 1
130.216.30.179 1
130.216.30.178 0
130.216.30.177 2
130.216.30.176 3
130.216.30.175 2
130.216.30.174 0
130.216.30.173 3
130.216.30.172 1
130.216.30.171 3
130.216.30.170 0
10.19.99.253 2
10.19.99.252 3
10.19.99.251 1
10.19.99.250 0
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> stop node 3"

required_result <<EOF
130.216.30.181 2
130.216.30.180 1
130.216.30.179 1
130.216.30.178 0
130.216.30.177 2
130.216.30.176 0
130.216.30.175 2
130.216.30.174 0
130.216.30.173 2
130.216.30.172 1
130.216.30.171 1
130.216.30.170 0
10.19.99.253 2
10.19.99.252 0
10.19.99.251 1
10.19.99.250 0
EOF

simple_test 0,0,0,0x20 <<EOF
$_out
EOF

echo "Continue node 3, all healthy"

required_result <<EOF
130.216.30.181 2
130.216.30.180 3
130.216.30.179 1
130.216.30.178 3
130.216.30.177 2
130.216.30.176 0
130.216.30.175 3
130.216.30.174 0
130.216.30.173 2
130.216.30.172 1
130.216.30.171 1
130.216.30.170 0
10.19.99.253 2
10.19.99.252 3
10.19.99.251 1
10.19.99.250 0
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> node 0 stopped"

required_result <<EOF
130.216.30.181 2
130.216.30.180 3
130.216.30.179 1
130.216.30.178 3
130.216.30.177 2
130.216.30.176 1
130.216.30.175 3
130.216.30.174 2
130.216.30.173 2
130.216.30.172 1
130.216.30.171 1
130.216.30.170 3
10.19.99.253 2
10.19.99.252 3
10.19.99.251 1
10.19.99.250 2
EOF

simple_test 0x20,0,0,0 <<EOF
$_out
EOF

echo "Continue node 0, all healthy"

required_result <<EOF
130.216.30.181 2
130.216.30.180 0
130.216.30.179 0
130.216.30.178 3
130.216.30.177 2
130.216.30.176 1
130.216.30.175 3
130.216.30.174 0
130.216.30.173 2
130.216.30.172 1
130.216.30.171 1
130.216.30.170 3
10.19.99.253 0
10.19.99.252 3
10.19.99.251 1
10.19.99.250 2
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> node 1 stopped"

required_result <<EOF
130.216.30.181 2
130.216.30.180 0
130.216.30.179 0
130.216.30.178 3
130.216.30.177 2
130.216.30.176 3
130.216.30.175 3
130.216.30.174 0
130.216.30.173 2
130.216.30.172 0
130.216.30.171 2
130.216.30.170 3
10.19.99.253 0
10.19.99.252 3
10.19.99.251 0
10.19.99.250 2
EOF

simple_test 0,0x20,0,0 <<EOF
$_out
EOF

echo "Continue node 1, all healthy"

required_result <<EOF
130.216.30.181 1
130.216.30.180 0
130.216.30.179 0
130.216.30.178 1
130.216.30.177 2
130.216.30.176 3
130.216.30.175 3
130.216.30.174 1
130.216.30.173 2
130.216.30.172 0
130.216.30.171 2
130.216.30.170 3
10.19.99.253 1
10.19.99.252 3
10.19.99.251 0
10.19.99.250 2
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> node 2 stopped"

required_result <<EOF
130.216.30.181 1
130.216.30.180 0
130.216.30.179 0
130.216.30.178 1
130.216.30.177 3
130.216.30.176 3
130.216.30.175 3
130.216.30.174 1
130.216.30.173 1
130.216.30.172 0
130.216.30.171 0
130.216.30.170 3
10.19.99.253 1
10.19.99.252 3
10.19.99.251 0
10.19.99.250 1
EOF

simple_test 0,0,0x20,0 <<EOF
$_out
EOF

echo "Continue node 2, all healthy"

required_result <<EOF
130.216.30.181 1
130.216.30.180 2
130.216.30.179 0
130.216.30.178 1
130.216.30.177 2
130.216.30.176 3
130.216.30.175 3
130.216.30.174 2
130.216.30.173 1
130.216.30.172 0
130.216.30.171 0
130.216.30.170 3
10.19.99.253 2
10.19.99.252 3
10.19.99.251 0
10.19.99.250 1
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

echo "All healthy -> node 3 stopped"

required_result <<EOF
130.216.30.181 1
130.216.30.180 2
130.216.30.179 0
130.216.30.178 1
130.216.30.177 2
130.216.30.176 0
130.216.30.175 2
130.216.30.174 2
130.216.30.173 1
130.216.30.172 0
130.216.30.171 0
130.216.30.170 1
10.19.99.253 2
10.19.99.252 0
10.19.99.251 0
10.19.99.250 1
EOF

simple_test 0,0,0,0x20 <<EOF
$_out
EOF

echo "Continue node 3, all healthy"

required_result <<EOF
130.216.30.181 3
130.216.30.180 2
130.216.30.179 3
130.216.30.178 1
130.216.30.177 2
130.216.30.176 0
130.216.30.175 3
130.216.30.174 2
130.216.30.173 1
130.216.30.172 0
130.216.30.171 0
130.216.30.170 1
10.19.99.253 2
10.19.99.252 3
10.19.99.251 0
10.19.99.250 1
EOF

simple_test 0,0,0,0 <<EOF
$_out
EOF

