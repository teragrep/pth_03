/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019, 2020, 2021, 2022  Suomen Kanuuna Oy
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://github.com/teragrep/teragrep/blob/main/LICENSE>.
 *
 *
 * Additional permission under GNU Affero General Public License version 3
 * section 7
 *
 * If you modify this Program, or any covered work, by linking or combining it
 * with other code, such other code is not for that reason alone subject to any
 * of the requirements of the GNU Affero GPL version 3 as long as this Program
 * is the same Program as licensed from Suomen Kanuuna Oy without any additional
 * modifications.
 *
 * Supplemented terms under GNU Affero General Public License version 3
 * section 7
 *
 * Origin of the software must be attributed to Suomen Kanuuna Oy. Any modified
 * versions must be marked as "Modified version of" The Program.
 *
 * Names of the licensors and authors may not be used for publicity purposes.
 *
 * No rights are granted for use of trade names, trademarks, or service marks
 * which are in The Program if any.
 *
 * Licensee must indemnify licensors and authors for any liability that these
 * contractual assumptions impose on licensors and authors.
 *
 * To the extent this program is licensed as part of the Commercial versions of
 * Teragrep, the applicable Commercial License may apply to this file if you as
 * a licensee so wish it.
 */
// -*- mode: conf; -*-

lexer grammar COMMAND_TERAGREP_MODE;

COMMAND_TERAGREP_MODE_ANTLR_BUG: 'command_teragrep_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ COMMAND_TERAGREP_MODE ++++++++++++++
mode COMMAND_TERAGREP_MODE;

// skip
COMMAND_TERAGREP_MODE_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_TERAGREP_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_TERAGREP_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
COMMAND_TERAGREP_MODE_GET: ('get' | 'GET');
COMMAND_TERAGREP_MODE_EXEC: 'exec'|'EXEC' ;
COMMAND_TERAGREP_MODE_SET: 'set' ;
COMMAND_TERAGREP_MODE_LIST: 'list';
COMMAND_TERAGREP_MODE_SAVE: 'save' | 'SAVE';
COMMAND_TERAGREP_MODE_HDFS: 'hdfs' | 'HDFS';
COMMAND_TERAGREP_MODE_BLOOM: 'bloom' | 'BLOOM';
COMMAND_TERAGREP_MODE_CREATE: 'create';
COMMAND_TERAGREP_MODE_UPDATE: 'update';
COMMAND_TERAGREP_MODE_ESTIMATE: 'estimate';
COMMAND_TERAGREP_MODE_DELETE: 'delete' | 'DELETE';
COMMAND_TERAGREP_MODE_KAFKA: 'KAFKA' | 'kafka';
COMMAND_TERAGREP_MODE_EXPLAIN: 'explain';
COMMAND_TERAGREP_MODE_OVERWRITE: 'overwrite=' -> pushMode(GET_BOOLEAN);
COMMAND_TERAGREP_MODE_PARSER: 'parser';
COMMAND_TERAGREP_MODE_HOST: 'host' -> pushMode(COMMAND_TERAGREP_IP_MODE);
COMMAND_TERAGREP_MODE_PORT: 'port' -> pushMode(COMMAND_TERAGREP_IP_MODE);
COMMAND_TERAGREP_MODE_DOT: '.';
COMMAND_TERAGREP_MODE_TOKENIZER: 'tokenizer';
COMMAND_TERAGREP_MODE_SYSLOG: 'syslog';
COMMAND_TERAGREP_MODE_STREAM: 'stream';
COMMAND_TERAGREP_MODE_LOAD: 'load';
COMMAND_TERAGREP_MODE_SYSTEM: 'system';
COMMAND_TERAGREP_MODE_VERSION: 'version';
COMMAND_TERAGREP_MODE_ARCHIVE: 'archive';
COMMAND_TERAGREP_MODE_SUMMARY: 'summary' -> pushMode(DEFAULT_MODE);
COMMAND_TERAGREP_MODE_RETENTION: 'retention=' -> pushMode(GET_SPAN);
COMMAND_TERAGREP_MODE_CODEC: 'codec=' -> pushMode(GET_STRING);

COMMAND_TERAGREP_MODE_HDFS_FORMAT: 'format=';
COMMAND_TERAGREP_MODE_CSV_FORMAT: ('csv'|'CSV');
COMMAND_TERAGREP_MODE_JSON_FORMAT: ('json'|'JSON');
COMMAND_TERAGREP_MODE_DEFAULT_FORMAT: ('default'|'DEFAULT'|'avro'|'AVRO');
COMMAND_TERAGREP_MODE_FORMAT: 'format' -> pushMode(GET_STRING);
COMMAND_TERAGREP_MODE_INPUT: 'input' -> pushMode(GET_FIELD);
COMMAND_TERAGREP_MODE_OUTPUT: 'output' -> pushMode(GET_FIELD);
COMMAND_TERAGREP_MODE_ESTIMATES: 'estimates' -> pushMode(GET_FIELD);
COMMAND_TERAGREP_MODE_HEADER: 'header=' -> pushMode(GET_BOOLEAN);
COMMAND_TERAGREP_MODE_SCHEMA: 'schema=' -> pushMode(GET_STRING);

COMMAND_TERAGREP_MODE_DYNATRACE: 'dynatrace' ;
COMMAND_TERAGREP_MODE_METRIC: 'metric' ;
COMMAND_TERAGREP_MODE_WRITE: 'write' ;

COMMAND_TERAGREP_MODE_SINGLE_QUOTED: '\'' ( '\\'. | ~('\''| '\\'))* '\'' -> type(GET_STRING_SINGLE_QUOTED);
COMMAND_TERAGREP_MODE_QUOTED: '"' ( '\\'. | ~('"'| '\\'))* '"' -> type(GET_STRING_DOUBLE_QUOTED);

COMMAND_TERAGREP_MOD_STRING
        // one or more characters
        : (CHAR)+ -> type(GET_STRING_STRING);

fragment CHAR
         :'\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         |'\u0027' // '
         //|'\u0028' // (
         //|'\u0029' // )
         |'\u002A' // *
         |'\u002B' // +
         |'\u002C' // ,
         |'\u002D' // -
         |'\u002E' // .
         |'\u002F' // /
         |'\u0030' // 0
         |'\u0031' // 1
         |'\u0032' // 2
         |'\u0033' // 3
         |'\u0034' // 4
         |'\u0035' // 5
         |'\u0036' // 6
         |'\u0037' // 7
         |'\u0038' // 8
         |'\u0039' // 9
         |'\u003A' // :
         |'\u003B' // ;
         |'\u003C' // <
         |'\u003D' // =
         |'\u003E' // >
         |'\u003F' // ?
         |'\u0040' // @
         |'\u0041' // A
         |'\u0042' // B
         |'\u0043' // C
         |'\u0044' // D
         |'\u0045' // E
         |'\u0046' // F
         |'\u0047' // G
         |'\u0048' // H
         |'\u0049' // I
         |'\u004A' // J
         |'\u004B' // K
         |'\u004C' // L
         |'\u004D' // M
         |'\u004E' // N
         |'\u004F' // O
         |'\u0050' // P
         |'\u0051' // Q
         |'\u0052' // R
         |'\u0053' // S
         |'\u0054' // T
         |'\u0055' // U
         |'\u0056' // V
         |'\u0057' // W
         |'\u0058' // X
         |'\u0059' // Y
         |'\u005A' // Z
         // |'\u005B' // [
         |'\u005C' // \
         // |'\u005D' // ]
         |'\u005E' // ^
         |'\u005F' // _
         |'\u0060' // `
         |'\u0061' // a
         |'\u0062' // b
         |'\u0063' // c
         |'\u0064' // d
         |'\u0065' // e
         |'\u0066' // f
         |'\u0067' // g
         |'\u0068' // h
         |'\u0069' // u
         |'\u006A' // j
         |'\u006B' // k
         |'\u006C' // l
         |'\u006D' // m
         |'\u006E' // n
         |'\u006F' // o
         |'\u0070' // p
         |'\u0071' // q
         |'\u0072' // r
         |'\u0073' // s
         |'\u0074' // t
         |'\u0075' // u
         |'\u0076' // v
         |'\u0077' // w
         |'\u0078' // x
         |'\u0079' // y
         |'\u007A' // z
         |'\u007B' // {
         // |'\u007C' // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         ;
mode COMMAND_TERAGREP_IP_MODE;
COMMAND_TERAGREP_IP_MODE_SPACE: SPACE -> channel(HIDDEN);
COMMAND_TERAGREP_IP_MODE_IP: DIGIT(COMMAND_TERAGREP_IP_MODE_COMMA)DIGIT(COMMAND_TERAGREP_IP_MODE_COMMA)DIGIT(COMMAND_TERAGREP_IP_MODE_COMMA)DIGIT -> popMode;
fragment DIGIT: [0-9]+;
COMMAND_TERAGREP_IP_MODE_COMMA: '.';
COMMAND_TERAGREP_IP_MODE_PORT_NUM: DIGIT -> popMode;
COMMAND_TERAGREP_IP_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);
