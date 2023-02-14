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

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

public class EvalSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "eval",
            "eval2",
            "eval3",
            "eval4",
            "eval5",
            "eval6",
            "eval7",
            "eval8"
    })
    public void evalSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }
//    FIXME XML is incomplete for test cases with multiple <field>=<expression> statements. Only the first statement shows up in the XMLs.
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalNumberType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval2",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval3",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval4",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalStatement[1]/evalFieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval4",
    })
    void xpathTest7(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalStatement[2]/evalStringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest8(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement/evalStatement[1]/evalFunctionStatement/evalMethodSubstr/evalStatement[1]/evalFieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest9(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement/evalStatement[1]/evalFunctionStatement/evalMethodSubstr/evalStatement[2]/evalNumberType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest10(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[1]/evalStatement[2]/evalStringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest11(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[2]/evalFunctionStatement/evalMethodLen/evalStatement/evalFieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest12(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[3]/evalFunctionStatement/evalMethodFalse/value[1]";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval7",
    })
    void xpathTest13(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[1]/evalFunctionStatement/evalMethodTrue/value[1]";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval7",
    })
    void xpathTest14(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[2]/evalStringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
}
