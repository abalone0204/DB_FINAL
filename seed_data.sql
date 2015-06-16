INSERT INTO Student (STU_ID, NAME) VALUES
(99207342, "古宗禎"), 
(101304004,"蔡其展"),
(100304024,"王致輝"),
(101304054,"何信賢"),
(100304007, "林致誠");

INSERT INTO STANDARD (NAME, GRAD_YEAR, TYPE, DEPARTMENT) VALUES
("統計系",2015,"畢業","統計系"),
("數理財務學程",2015,"學程", "統計系"),
("會計輔系",2015,"輔系","會計系"),
("日文輔系",2015,"輔系","日文系");

-- 統計系
INSERT INTO RULE (STAND_NAME, C_NAME, CATEGORY, DEPARTMENT, CREDIT, GRAD_YEAR) VALUES
("統計系","經濟學","必","商學院",6,2015),
("統計系","統計學","必","商學院",6,2015),
("統計系","微積分","必","商學院",6,2015),
("統計系","線性代數","必","統計系",6,2015),
("統計系","機率論","必","統計系",3,2015),
("統計系","高等微積分(一)","必","統計系",3,2015),
("統計系","初級會計學(一)","必","商學院",3,2015),
("統計系","初級會計學(二)","必","商學院",3,2015),
("統計系","管理學/企業概論","必","商學院",3,2015),
("統計系","商事法","必","法律系",2,2015),
("統計系","數理統計學(一)","必","統計系",3,2015),
("統計系","數理統計學(二)","必","統計系",3,2015),
("統計系","迴歸分析(一)","必","統計系",3,2015),
("統計系","抽樣調查方法","必","統計系",3,2015),
("統計系","企業倫理與社會責任","必","企管系",1,2015),
("統計系","變異數分析與實驗設計","必","統計系",3,2015),
("統計系","時間數列分析","必","統計系",3,2015),
("統計系","多變量分析","必","統計系",3,2015);

-- 會計輔系

INSERT INTO RULE (STAND_NAME, C_NAME, CATEGORY, DEPARTMENT, CREDIT, GRAD_YEAR) VALUES
("會計輔系","經濟學","必", "商學院",3,2015),
("會計輔系","管理學","必", "商學院",3,2015),
("會計輔系","初級會計學 (一)","必","商學院",3,2015),
("會計輔系","初級會計學 (二)","必","商學院",3,2015),
("會計輔系","中級會計學 (一)","必","會計系",3,2015),
("會計輔系","中級會計學 (二)","必","會計系",3,2015),
("會計輔系","成本管理會計(一)","必","會計系",3,2015),
("會計輔系","成本管理會計(二)","必","會計系",3,2015),
("會計輔系","稅務法規","必","會計系",3,2015),
("會計輔系","中級會計學(三)","選","會計系",3,2015),
("會計輔系","高級會計學(一)","選","會計系",3,2015),
("會計輔系","高級會計學(二)","選","會計系",3,2015),
("會計輔系","審計學(一)","選","會計系",3,2015),
("會計輔系","審計學(二)","選","會計系",3,2015),
("會計輔系","財務報表分析","選","會計系",3,2015),
("會計輔系","會計資訊系統","選","會計系",3,2015);

-- 日文輔系
INSERT INTO RULE (STAND_NAME, C_NAME, CATEGORY, DEPARTMENT, CREDIT, GRAD_YEAR) VALUES
("日文輔系","初級日語","必","日文系",6,2015),
("日文輔系","日語會話(一)","必","日文系",4,2015),
("日文輔系","日語演習(一)","必","日文系",2,2015),
("日文輔系","中級日語","必","日文系",6,2015),
("日文輔系","日語會話(二)","必","日文系",4,2015),
("日文輔系","日語演習(二)","必","日文系",2,2015),
("日文輔系","日文寫作","必","日文系",4,2015),
("日文輔系","日本通識ABCDE","群","日文系",4,2015),
("日文輔系","大學外文:日文(一)","選","外文中心",3,2015),
("日文輔系","大學外文:日文(二)","選","外文中心",3,2015),
("日文輔系","大學外文:日文(三)","選","外文中心",3,2015),
("日文輔系","大學外文:日文(四)","選","外文中心",3,2015);

INSERT INTO Grad_type(STU_ID, STAND_NAME, GRAD_YEAR) VALUES
(99207342, "統計系",2015),
(101304004, "會計輔系",2015),
(100304024, "統計系",2015),
(101304054, "日文輔系", 2015),
(100304007, "統計系", 2015),
(100304007, "會計輔系", 2015);


INSERT INTO Course(C_ID, NAME, CREDIT, CATEGORY, TEACHER, DEPARTMENT) VALUES
("000219511","經濟學",3,"必","吳文傑","商學院"),
("000219512","經濟學",3,"必","吳文傑","商學院"),
("000321021","統計學",3,"必","鄭宗記","商學院"),
("000321022","統計學",3,"必","鄭宗記","商學院"),
("304002001","微積分",3,"必","黃子銘","商學院"),
("304002002","微積分",3,"必","黃子銘","商學院"),
("304004001","線性代數",3,"必","洪英超","統計系"),
("304004002","線性代數",3,"必","洪英超","統計系"),
("304025001","機率論",3,"必","劉惠美" ,"統計系"),
("304020001","高等微積分(一)",3,"必","薛慧敏","統計系"),
("000314011","初級會計學(一)",3,"必","鍾宇軒","商學院"),
("000314012","初級會計學(二)",3,"必","鍾宇軒","商學院"),
("000348001","管理學",3,"必","董珮如","商學院"),
("000604021","商事法",2,"必","王文杰","法律系"),
("304026001","數理統計學(一)",3,"必","劉惠美","統計系"),
("304029001","數理統計學(二)",3,"必","劉惠美","統計系"),
("304008001","迴歸分析(一)",3,"必","江振東","統計系"),
("304021001","抽樣調查方法",3,"必","鄭天澤","統計系"),
("000356051","企業倫理與社會責任",1,"必","蘇威傑","企管系"),
("304022001","變異數分析與實驗設計",3,"必","陳麗霞","統計系"),
("304028001","時間數列分析",3,"必","鄭宗記","統計系"),
("304023001","多變量分析",3,"必","鄭宇庭","統計系");

INSERT INTO Course(C_ID, NAME, CREDIT, CATEGORY, TEACHER, DEPARTMENT) VALUES
("010102011","初級日語",2,"必","葉寶珠","日文系"),
("010102012","初級日語",2,"必","葉寶珠","日文系"),
("010102032","初級日語",2,"必","葉寶珠","日文系"),
("010103031","日語會話(一)",4,"必","郭獻尹","日文系"),
("010131001","日語演習(一)",2,"必","武下志保子","日文系"),
("010104001","中級日語",3,"必","林士鈞","日文系"),
("010104002","中級日語",3,"必","林士鈞","日文系"),
("010103032","日語會話(二)",4,"必","郭獻尹","日文系"),
("010131002","日語演習(二)",2,"必","武下志保子","日文系"),
("010107001","日文寫作",2,"必","許菁娟","日文系"),
("010107002","日文寫作",2,"必","許菁娟","日文系"),
("010107012","日本通識ABCDE",4,"群","山本小太郎","日文系");

INSERT INTO Course(C_ID, NAME, CREDIT, CATEGORY, TEACHER, DEPARTMENT) VALUES
("000323011","中級會計學(一)",3,"必","張清福","會計系"),
("000323012","中級會計學(二)",3,"必","張清福","會計系"),
("000337011","成本管理會計(一)",3,"必","梁嘉紋","會計系"),
("000337012","成本管理會計(二)",3,"必","梁嘉紋","會計系"),
("303013001","稅務法規",3,"必","李明昱","會計系"),
("000323021","中級會計學(三)",3,"選","張清福","會計系"),
("303032001","高級會計學(一)",3,"選","林美花","會計系"),
("303032002","高級會計學(二)",3,"選","林美花","會計系"),
("010120001","審計學(一)",3,"選","江美艷","會計系"),
("010120002","審計學(二)",3,"選","江美艷","會計系"),
("303019011","財務報表分析",3,"選","詹凌菁","會計系"),
("303010001","會計資訊系統",3,"選","諶家蘭","會計系");

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("99207342","000219511",77),
("99207342","000219512",87),
("99207342","000314011",87),
("99207342","000314012",76),
("99207342","000321021",72),
("99207342","000321022",73),
("99207342","000356051",66),
("99207342","000604021",81),
("99207342","304002001",78),
("99207342","304002002",86),
("99207342","304004001",93),
("99207342","304004002",64),
("99207342","304008001",89),
("99207342","304020001",75),
("99207342","304021001",84),
("99207342","304022001",76),
("99207342","304023001",92),
("99207342","304025001",68),
("99207342","304026001",69),
("99207342","304028001",72),
("99207342","304029001",73);

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("100304024","000219511",66),
("100304024","000219512",51),
("100304024","000314011",57),
("100304024","000314012",62),
("100304024","000321021",58),
("100304024","000321022",65),
("100304024","000356051",63),
("100304024","000604021",58),
("100304024","304002001",66),
("100304024","304002002",70),
("100304024","304004001",60),
("100304024","304004002",55),
("100304024","304008001",59),
("100304024","304020001",70),
("100304024","304021001",50),
("100304024","304022001",60),
("100304024","304023001",66),
("100304024","304025001",64),
("100304024","304026001",51),
("100304024","304028001",53),
("100304024","304029001",50);

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("101304054","010102011",71),
("101304054","010102012",99),
("101304054","010102032",79),
("101304054","010103031",93),
("101304054","010103032",95),
("101304054","010104001",64),
("101304054","010104002",72),
("101304054","010107001",76),
("101304054","010107002",82),
("101304054","010107012",78),
("101304054","010131001",96),
("101304054","010131002",67);

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("101304004","010102011",60),
("101304004","010102012",52),
("101304004","010102032",55),
("101304004","010103031",53),
("101304004","010103032",61),
("101304004","010104001",69),
("101304004","010104002",64),
("101304004","010107001",53),
("101304004","010107002",68),
("101304004","010107012",67),
("101304004","010131001",54),
("101304004","010131002",64);

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("101304054","000314011",65),
("101304054","000314012",90),
("101304054","000321021",87),
("101304054","000321022",100),
("101304054","000356051",63),
("101304054","000604021",76),
("101304054","304002001",89),
("101304054","304002002",72),
("101304054","304004001",97),
("101304054","304004002",74),
("101304054","304008001",94),
("101304054","304020001",99),
("101304054","304021001",79),
("101304054","304022001",64),
("101304054","304023001",83),
("101304054","304025001",80),
("101304054","304026001",62),
("101304054","304028001",70),
("101304054","304029001",75),
("101304054","000219511",72),
("101304054","000219512",77),
("101304054","000323021",66),
("101304054","000337011",80),
("101304054","000337012",62),
("101304054","000348001",84),
("101304054","010120001",97),
("101304054","010120002",76),
("101304054","303010001",77),
("101304054","303013001",67),
("101304054","303019011",68),
("101304054","303032001",98),
("101304054","303032002",83);

INSERT INTO Performance(STU_ID, C_ID, GRADE) VALUES
("100304007","000219511",68),
("100304007","000219512",63),
("100304007","000314011",55),
("100304007","000314012",55),
("100304007","000321021",69),
("100304007","000321022",61),
("100304007","000356051",52),
("100304007","000604021",50),
("100304007","304002001",62),
("100304007","304002002",57),
("100304007","304004001",61),
("100304007","304004002",61),
("100304007","304008001",63),
("100304007","304020001",65),
("100304007","304021001",54),
("100304007","304022001",55),
("100304007","304023001",66),
("100304007","304025001",62),
("100304007","304026001",56),
("100304007","304028001",53),
("100304007","304029001",51),
("100304007","000323021",60),
("100304007","000337011",59),
("100304007","000337012",59),
("100304007","000348001",70),
("100304007","010120001",63),
("100304007","010120002",70),
("100304007","303010001",52),
("100304007","303013001",50),
("100304007","303019011",58),
("100304007","303032001",70),
("100304007","303032002",57);