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
package com.teragrep.pth_03.tests;

import com.teragrep.pth_03.ParserStructureTestingUtility;
import com.teragrep.pth_03.ParserSyntaxTestingUtility;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TeragrepSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "teragrep",
            "teragrep2",
            "teragrep3",
            "teragrep4",
            "teragrep5",
            "teragrep6",
            "teragrep7",
            "teragrep8",
            "teragrep9",
            "teragrep10",
            "teragrep11",
            "teragrep12",
            "teragrep_csv_schema",
            "teragrep_csv_header",
            "teragrep_archive_summary",
            "teragrep_syslog_stream",
            "teragrep_syslog_stream_host_port"
    })
    public void teragrepSyntaxParseTest(String arg) {
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep",
    })
    void xpathTest1(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep",
    })
    void xpathTest2(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_getParameter/t_getTeragrepVersionParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep4",
    })
    void xpathTest3(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_kafkaSaveModeParameter/value[1]";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_tokenizer",
    })
    void xpathTestTokenizer(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_tokenizerParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep7",
    })
    void xpathTestDynatrace(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_dynatraceParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep8",
    })
    void xpathTestDynatraceWithOptionalParam(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_dynatraceParameter/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep9",
    })
    void xpathTestCsvSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep10",
    })
    void xpathTestJsonSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep11",
    })
    void xpathTestDefaultSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep12",
    })
    void xpathTestCsvLoad(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_csv_header",
    })
    void xpathTestCsvLoadHeader(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_headerParameter/booleanType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_csv_schema",
    })
    void xpathTestCsvLoadSchema(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_schemaParameter/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_archive_summary",
    })
    void xpathTestArchiveSummary(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_getParameter/t_getArchiveSummaryParameter/searchTransformationRoot/directoryStatement/directoryStatement/indexStatement/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_syslog_stream",
    })
    void syslogStreamTest(String arg) { // includes an eval command in the end of the query to make sure commands given after syslog work too
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String syslogPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter";
        String evalPath = "/root/transformStatement/transformStatement/evalTransformation";

        NodeList syslogNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, syslogPath, true));
        NodeList evalNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, evalPath, false));

        // Check that 1 found
        assertEquals(1,syslogNodes.getLength());
        assertEquals(1,evalNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_syslog_stream_host_port",
    })
    void syslogStreamWithHostAndPortTest(String arg) { // includes an eval command in the end of the query to make sure commands given after syslog work too
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String syslogPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter";
        String hostPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter/t_hostParameter";
        String portPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter/t_hostParameter/t_portParameter";
        String evalPath = "/root/transformStatement/transformStatement/evalTransformation";

        NodeList syslogNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, syslogPath, false));
        NodeList hostNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, hostPath, false));
        NodeList portNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, portPath, false));
        NodeList evalNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, evalPath, false));

        // Check that 1 found
        assertEquals(1,syslogNodes.getLength());
        assertEquals(1,hostNodes.getLength());
        assertEquals(1,portNodes.getLength());
        assertEquals(1,evalNodes.getLength());
    }
}
