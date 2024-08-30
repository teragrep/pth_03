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
parser grammar DPLParserTransform_teragrep;

teragrepTransformation
        : COMMAND_MODE_TERAGREP ( t_execParameter | t_getParameter)
        ;

t_execParameter
        : COMMAND_TERAGREP_MODE_EXEC (t_syslogModeParameter
        | t_listModeParameter
        | t_saveModeParameter
        | t_parserExplainParameter
        | t_deleteModeParameter
        | t_loadModeParameter
        | t_kafkaSaveModeParameter
        | t_bloomModeParameter
        | t_tokenizerParameter
        | t_dynatraceParameter)
        ;

t_dynatraceParameter
        : COMMAND_TERAGREP_MODE_DYNATRACE COMMAND_TERAGREP_MODE_METRIC COMMAND_TERAGREP_MODE_WRITE stringType?
        ;

t_tokenizerParameter
        : COMMAND_TERAGREP_MODE_TOKENIZER t_formatParameter? t_inputParamater? t_outputParameter? t_patternParameter?
        ;

t_formatParameter
        : COMMAND_TERAGREP_MODE_FORMAT stringType
        ;

t_inputParamater
        : COMMAND_TERAGREP_MODE_INPUT fieldType
        ;

t_outputParameter
        : COMMAND_TERAGREP_MODE_OUTPUT fieldType
        ;

t_patternParameter
        : COMMAND_TERAGREP_MODE_PATTERN fieldType
        ;

t_estimatesParameter
        : COMMAND_TERAGREP_MODE_ESTIMATES fieldType
        ;

t_syslogModeParameter
        : COMMAND_TERAGREP_MODE_SYSLOG COMMAND_TERAGREP_MODE_STREAM t_hostParameter?
        ;

t_kafkaSaveModeParameter
        : COMMAND_TERAGREP_MODE_KAFKA COMMAND_TERAGREP_MODE_SAVE  t_topicParameter
        ;

t_bloomModeParameter
        : COMMAND_TERAGREP_MODE_BLOOM t_bloomOptionParameter
        ;

t_parserExplainParameter
        : COMMAND_TERAGREP_MODE_PARSER COMMAND_TERAGREP_MODE_EXPLAIN
        ;

t_loadModeParameter
        : COMMAND_TERAGREP_MODE_HDFS COMMAND_TERAGREP_MODE_LOAD (t_pathParameter|t_hdfsFormatParameter|t_headerParameter|t_schemaParameter)*
        ;

t_saveModeParameter
        : COMMAND_TERAGREP_MODE_HDFS COMMAND_TERAGREP_MODE_SAVE (t_codecParameter|t_pathParameter|t_retentionParameter|t_overwriteParameter|t_hdfsFormatParameter|t_headerParameter)*
        ;

t_deleteModeParameter
        : COMMAND_TERAGREP_MODE_HDFS COMMAND_TERAGREP_MODE_DELETE  t_pathParameter?
        ;

t_listModeParameter
        : COMMAND_TERAGREP_MODE_HDFS COMMAND_TERAGREP_MODE_LIST  t_pathParameter?
        ;

t_getParameter
        : (COMMAND_TERAGREP_MODE_GET | COMMAND_TERAGREP_MODE_SET) (t_getTeragrepVersionParameter | t_getArchiveSummaryParameter) numberType?
        ;

t_getTeragrepVersionParameter
        : COMMAND_TERAGREP_MODE_SYSTEM COMMAND_TERAGREP_MODE_VERSION
        ;

t_getArchiveSummaryParameter
        : COMMAND_TERAGREP_MODE_ARCHIVE COMMAND_TERAGREP_MODE_SUMMARY searchTransformationRoot
        ;

t_bloomOptionParameter
        : COMMAND_TERAGREP_MODE_UPDATE t_estimatesParameter? t_inputParamater? t_patternParameter? | COMMAND_TERAGREP_MODE_CREATE t_estimatesParameter? t_inputParamater? t_patternParameter? | COMMAND_TERAGREP_MODE_ESTIMATE t_inputParamater? t_outputParameter?
        ;

t_hostParameter
        : COMMAND_TERAGREP_MODE_HOST t_portParameter COMMAND_TERAGREP_MODE_PORT COMMAND_TERAGREP_IP_MODE_PORT_NUM
        ;

t_portParameter
        : COMMAND_TERAGREP_IP_MODE_IP
        ;

t_overwriteParameter
        : COMMAND_TERAGREP_MODE_OVERWRITE booleanType
        ;

t_pathParameter
        : stringType
        ;

t_topicParameter
        : stringType
        ;

t_hdfsFormatParameter
        : COMMAND_TERAGREP_MODE_HDFS_FORMAT
            (COMMAND_TERAGREP_MODE_CSV_FORMAT|
            COMMAND_TERAGREP_MODE_JSON_FORMAT|
            COMMAND_TERAGREP_MODE_DEFAULT_FORMAT)
        ;

t_headerParameter
        : COMMAND_TERAGREP_MODE_HEADER booleanType
        ;

t_schemaParameter
        : COMMAND_TERAGREP_MODE_SCHEMA stringType
        ;

t_retentionParameter
        : COMMAND_TERAGREP_MODE_RETENTION spanType
        ;

t_codecParameter
        : COMMAND_TERAGREP_MODE_CODEC stringType
        ;