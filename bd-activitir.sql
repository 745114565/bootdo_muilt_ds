/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.7.13-log : Database - bd-activiti
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd-activiti` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bd-activiti`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('135065',1,'æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹.bpmn20.xml','135064','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"salary\" name=\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"å¯åŠ¨å®¡æ‰¹\" activiti:initiator=\"apply\" activiti:formKey=\"/act/salary/form\"></startEvent>\n    <endEvent id=\"end\" name=\"ç»“æŸå®¡æ‰¹\"></endEvent>\n    <userTask id=\"modify\" name=\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\" activiti:assignee=\"${apply}\"></userTask>\n    <userTask id=\"audit\" name=\"è–ªé…¬ä¸»ç®¡åˆå®¡\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"></exclusiveGateway>\n    <userTask id=\"audit2\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"></sequenceFlow>\n    <userTask id=\"audit3\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"></sequenceFlow>\n    <userTask id=\"audit4\" name=\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"></exclusiveGateway>\n    <userTask id=\"apply_end\" name=\"è–ªé…¬æ¡£çº§å…‘ç°\" activiti:assignee=\"admin\"></userTask>\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"æ˜¯\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"æ˜¯\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"å¦\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"></sequenceFlow>\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"æ˜¯\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"æ˜¯\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"å¦\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"å¦\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"å¦\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"></sequenceFlow>\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"é”€æ¯\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_salary\">\n    <bpmndi:BPMNPlane bpmnElement=\"salary\" id=\"BPMNPlane_salary\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"240.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"225.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"153.0\" y=\"225.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\n        <omgdi:waypoint x=\"59.9965176371898\" y=\"255.32320080051775\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"91.4000015258789\" y=\"256.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"105.0\" y=\"255.44805199630667\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\n        <omgdi:waypoint x=\"201.0\" y=\"256.4158878504673\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"241.14537444933922\" y=\"258.8546255506608\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('135066',1,'æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹.salary.png','135064','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0õ\0\0¤\0\0\0pö‚\0\0B•IDATxÚíİõğ9Ç¹&rˆÍBÈ¡…	‡K¡pA>À<Ö+ÉB%Sˆã€ã0¶1s–9ÁaÊ˜`Œ	GJÇ)ŠlVzXA˜Â²x*€9±¤#2·Fv§“ùoZ½3;³OÍì~>UÿÚİ™ÙÙG÷÷ßıëÿ¿»+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`¤>â_\0\0\0\0gZŞ²ÚG\0\0\0 Cœ–·my[Pû8İ¿\0\0\0:§ O…|ŒÔoUØ\0\0@gôÍ\0\0\0ÚÀ´&…{zŞ9ö\0\0\0Ğ†}³‚İˆ=\0\0\0´‘Ó*Cêë\0\0€1,è§ãûúö\0\0\0ĞYıh}?\0\0\00Í.Š7Şï\0\0\0¡­©óFì\0\0`”/r÷;y»°öq(Êßçây\0\0\00ıôBaşı¼eµ­ö¾Oa\0\0\0ãPĞ‡k…y6„Â¾XĞ§6»ğ¼sì\0\0`5*´ëèƒöõ^O×;Ç\0\0\0F± Ÿ6„B½^aßjA_.ìMÅ\0\0€ahµ°nVØµ /şü­#ö\0\0\00¬‚¾Õ‚ºQa¿Ï0úÄ9ö\0\0\00†ı`…ıK#(èGúû\0\0\0À¤2Ò‘ñz…ıH\núraï{\0\0€NöÙÏ~6ÓÆ®åÿâ#\\D1å¾<BÿRíñ‘X`ùhš¦iš¦iZuŸ:»¨÷_3Í®vßÌ`#õ­ÜÇ¾#õ\0\0 ÂJL‹t_elÎ©Naïœz\0\0Pa%f…t«#ãn[Wïê÷C)ì]ı\0\0ÔCX‰Aaß¬ nvúf÷±odJÅ}ê\0@=„•˜ak6RŞ¬ ¯³°O§\0œm\0\0€z+1Ã×hÄ¾Õ‚~¨…}úy\nz\0\0Pa%fÄˆ}y*ü…•¡ß‡¾^a?»ôsœC\0\0ê!¬ÄŒAa_¼x^±@o¥ ¯4ù>·­\0\0õVbÆPy*~ä³+C¿M]ùû¦)è\0@=„•˜ñ/ìGªŞÔ~\0\0@=„•˜6/ìGû\0\0\0¨‡ÀJLF:eŞ”{\0\0Pa%¦\r\nû¡´»(\0\0¨‡°Ó†:…Ş”{\0\0Pa%¦û)yëËÛÙşe\0\0 ÂJLû˜V+Ø§\ròüV=\0\0¨‡°Ó\ZØ›r\0\0ê!°w`a¯ \0\0õX‰;°°_  \0\0õX‰;Ìïÿşï_ˆeå¶u\0\0 +q‡-§EŸùÌg²©S§îë¿\0\0ê!°wˆ®®®OäËiw,«îîn#õ\0\0 +qõc9ÕÚ:ÿ\0\0P•¸3–Ï”4JŸZ^ä»P\0\0¨‡ÀJÜËgQ± O£õÎ­\0\0õX‰Û{Ù¥O­»»ûlÿ!\0\0Pa%¶·ï²YR¯ ¯µµşC\0\0 ÂJl%nÏåÒp”Ş¹õ\0\0 +q{/—Eƒô®„\0\0ê!°[V\0\0`¬ÄXV\0\0`¬ÄXV\0\0`¬Ä–\0\0`+1–\0\0ØÇ+1–\0\0ØÇ+±e\0\0ØÇÆJŒe\0\0ö±ÁJŒe\0\0ö±ÁJŒe\0\0ö±ÁJlY\0\0ö±±cY\0€}l°cY\0€}l°[V\0\0€}l¬ÄXV\0\0`¬ÄXV\0\0`¬ÄXV\0\0`¬Ä–\0\0`+1–\0\0ØÇ+1–\0\0ØÇ+±e\0\0ØÇÆJŒe\0\0ö±ÁJŒe\0\0ö±ÁJlY\0\0ö±ÁJlY\0€}lûØX‰±¬\0\0À>6X‰±¬\0\0À>6X‰-+\0\0À>6Vb,+\0\0°\rVb,+\0\0°\rVbË\n\0\0°•ØJlY\0€}l°cY\0€}l°cY\0€}l°[V\0\0€}l¬ÄXV\0\0`¬ÄXV\0\0`¬Ä–\0\0`+1–\0\0ØÇ+1–\0\0ØÇ+ñeY¶ï«¯¾úÈ“O>ù›eË–e===ÛbYuòï¿téÒlÕªUŸ·Y’\0€z¬ÄMEA¿zõêlË–-Ù®]»´½Ü¶nİš­\\¹òİ¼À?Oú\0\0P•xP1B¯ o»Â~WOOÏÒ\0€z¬ÄƒŠ)÷\néökyQ¿[ú\0\0P•xPq.·\"º-‹z\'\0\0ê!°NQÿë_½™½ºîÙsK¿Vmñy<¦\0WÔ\0 +qõ}Ûz³\r?¾>ûùâköhñX<§WÔ\0 +q›õ›ûÛ}jo<·H®¨\0@=Vâv-ê_xâ›\r‹úxN®¨\0@=Vâ6-ê7ôÜØ°¨çáŠz\0\0ÔC`%VÔkŠz\0\0ÔC`%Í¢>®vß¨¨çáŠz\0\0ÔC`%nÓ¢~ãšï4,êã9E¸¢\0\0õX‰Û´¨§w}¶áñN½Ï‹çáŠz\0\0ÔC`%nÓ¢>ÚkOß? ¨ÇàŠz\0\0ÔC`%nç¢~çÎlãO¿;pê}şX<§WÔ\0 +qõ}Ûz³—×ÜÑğœúx.^£WÔ\0 +q»õ;wfon\\ıâG_nXĞ§¯‰×\ZµWÔ\0 +ñ^.ê›ÎµWÔ\0 +q›õ­ŒÎ6j¯(WÔ\0 +ñ^*ê‡[Ğ§¦(WÔ\0 +ñ^*ê5E=\0\0(ê±+ê5E=\0\0ê!°+êõ\0\0 +±¢~õİİİÿ%_7wH(\0\0ê!PÔkRÔ×Šù±^ê`\0P¢^İE}¹˜WÔ\0 +±¢¾Í‹ú|ıûó˜f_.æõ\0\0¨‡ÀJ¬¨oÓvË-·dõFæõ\0\0¨‡ÀJ¬¨oóÖ¬˜×4MÓ4mdÍ^.¨‡°Oø¢>{ì±Ç²Ù³gW[|KöÄO»Xİ±cGvâ‰\'V[z¿sÏ=·ÿó|0{àªŸoŞ¼9Û¸qcvæ™gV[úößÿlåÊ•Ù²eË²mÛ¶Uß7^¿dÉ’şŸ__{íµ{üìxìöÛo¯~şÆoìñÜÚµk«ÏoÚ´)›:ujµÿæ×^{m×oØ°¡úxü~ñuüìıöÛoHÿ‹øş;ï¼sĞé÷\\pÁÍ×Á÷\'Ê‰ÈÈÈX‰Ç©¨¢ó‘GğØÂ…÷xì™gÉÎ9çœjK\0Ê®¸âŠş×¿÷Ş{ÕïÏõõõUøá‡û_³uëÖş×Æ€xİ!‡Òÿü	\'œĞÿŞ¯¼òJõã‹/¾¸ÇïyÏ=÷ôÅw||şùç³E‹U?/ÿ]wÜqGõóø}Òû¾óÎ;ÕÏ‹¿[½ƒñõ±Ç[ıâVü¿Æïš~ßc9¦ús~úé=\n´p¡¼Ö+îå	l—\09yE}Ã¢şä“OP ¯Y³fÀè{ñë#<²ZÄ6zßÇ¼ÿ½î½÷ŞêÇ9?şøã«÷GQ)O¯¿ï¾ûª¯‰–fÄëÒ{Ä€ô{Åˆzzü®»îÊ:ê¨ê(úu×]·Çkcd>½ÿêÕ«³Å‹÷ÿÍ©à÷ŠW_}õ€¿7ï‰\Z1c fÄÏHïÃ\r7ÔıÛ?øÁV_ã¿kñàD³[Ú•Gîå	l—\09yEı€…gšsçÎİ£¨?øàƒ³£>zĞiåÍŠú}¯FØ£hiô•ÚHz½ƒ•ÚÔù9éùQD§ñ=•ÚÔùâ÷DáEvüŞwß}wõ±SO=µ¿ˆ×Å÷Äç÷ßõo»êª«ú¿?N3¨Ô¦ÈÇ†ôŞé½.»ì²jaıÕ¯~µúx¼.x(şşQü‹÷4C!¦ğ7šÑ¨¨OÒÈ½<í G / ¨¯[HG!ŸGñ],¶ë¡­õQ”§â6Şã€¨¦Çhy<vÑE\r8w?>¿õÖ[«ÓïãûÓÈ}pˆÇw\\õ<ûòAƒJm@y&AzÏôyüm1ÊŸK#ñq`#ŠşÃ;,ûÔ§>U}î­·ŞªNÅ¿1Šú8¸¯\r§Ÿ~zõoŠïY¯¿şzÿÏŠk¤sù£ÈŸW|¾|  YQ/O`»ÈÈX‰-êçÌ™Sı<F±£ø¢>³^¾P\\:w=Šæòû§¢8~ùóçgx`õÜôÛn»­D¾R©O#é©PƒõiÆ@Ìˆ‹ó­_¿¾ÿÔƒôÚ(Úãóx¾xmSN9¥zÀ!$ÄL‚¸X^ùi>½¶xN~ñ:q€øÓøõ€¼€•xÔŠú4RŸ§ié£QÔÇÈx\ZQ÷«ÙtĞAuß?¾>é¤“ªßÅqØqQºé®Î}\">Šå(®ãë(Îãëâü‹×(êÇÏŒ¢=\nó4õ>‹	õş?qEş¸rœƒ§$Ä‰8?‹ëÔ+êÓEøÒïSşË£ôŠz@@@^ÀJ<â¢şÑGíAÓE\Z…ôSO=5¢sêc4>Ö1ÊSÒ‹…|½¢>¾éœúJíªù•Â9õQHÏSOW¿o6ı>½&FÿcÄ<‹¿3}®Š_¯¨OgPˆóæÍ«¨f!¤ƒ‡zhuÊ~zô?ˆişŠz@@@^ÀJ<jE}´4ÓÜÓEåfÍšµÇğ£€‹ÏEK£à1â£ïéâpi:|úY•Â-æbúy,ˆ‚·ÑL€Ji¤>ÎW?ãŒ3¼WñV{•Ú”ö˜®_o¤>M½«Ñ§¿7\Z¤è¥ó÷ã¢|å¢>ı=q½x}ü·ÜrKö¡}¨ÿz\0Å»¿?~F¼wºÒ~ùÀ¢##°¹¨ë9¢:.÷î»ïÖ¥¾òÊ+ŞÒn°–Ş/FÕ+…[Ì•/ÄWü½*…Ñì4]>ŠáòïT<w>¾ƒ	ñúF3ŠçÔÇÇ¸Ø^üñ³‹3\rRá]ü™•Ú9üq0#Îé?ë¬³ªîkö¿ˆSbª~ñwMÒÈ¾¢##°«¨×Ú£)ê99y+±¢^Q/O G€¼`%VÔkŠzy99y+±¢^SÔrròVbE½¢^Àv	#PÔkŠzy99ä+±¢^SÔÛ(€¼€•XQ¯¨—\'@@@^ÀJ¬¨WÔËÈ G /X‰õš¢^@@@^ÀJ¬¨×õ€¼€•XQ¯¨—\'°]ääõš¢^@@\0yÁJ¬¨×õ6\n G G /`%VÔ+êå	##°—,[¶Lİ~mG^Ôï–\'@@@^ÀJ<¨U«V½¹eË…tµŞŞŞ¿Î‹úä	##°jùòåg­X±âWo¿ıövõŞ¡‚~éÒ¥¯çí<yäää¬ÄMåäôu1å;ÎåîÄöĞCe±¬:õ÷¯µøÿ¿0Qz##°Óh9-Še5uêÔ}ı7ä	ä#°wˆ®®®OäËiw,«îîîiş#òrÈÈX‰;§¨_Ë©ÖÖùÈÈ G /`%îŒå3%Ò§–ùÓıgä	ä#°·ÿòYT,èÓh½sëå	ä#°·÷²0JŸZww÷ÙşCòrÈÈVb+qû.›%õ\núZ[ë?$O G€¼`%¶·çri8JïÜzy9ää¬Äí½\\\rVĞ»¾<ròVbË\nËäää¬ÄXVXF G G /`%Æ²²Œ@\09y+±e…errÈVb,+,###°cYYF€¼€•Ø²Â29ää+1––ÈÈÈX‰±¬,#@@@^ÀJŒeeròVbË\nËää¬ÄXVXF G G /°7VØE±Ò6iëü§t8XF G G /Ğ~+ì”¼í¬¨ïêêšî?¥ÃÁ299yö\\i—RÔ¯:uê¾şK:,###hÏ•vJ£¢¾»»ûlÿ!–ÈÈÈ´÷Š[ïÜúuFéu8XF G G /Ğş+î€sëK¯ÃÁ299y‘ñÒëp°Œ@@@^ 3‹úOÎ¥Ÿæ?¢ÃÁ299yÎZ«çÖ¥×á`¼@ç­ÀS¬Ä:,###&­,Ëö}õÕWyòÉ\'³lÙ²¬§§§£Z¬Äö;/]º4[µjÕßçm–Ëä#†-\núÕ«Wg[¶lÉvíÚ¥SÛºuk¶råÊwóÿ<–È G /KŒĞ+è÷Za¿«§§ç–È G /KL¹W`ï½–õ»u8XF G€¼0,q·âz¯õ™Ëä#Æ´¨ÿõ¯ŞÌ^]÷ƒì¹¥_«¶ø<S˜+êu8– G G /´qQß·­7Ûğãë³Ÿ/¾fÅsŠsE½Ç2äää…6-ê7=÷·\núÔŞxn‘â\\Q¯Ã±Œ\099y¡]‹úøfÃ¢>Sœ+êu8– G G /´iQ¿¡çÆ†E}<§8WÔëp,#@@@^PÔ+êu8XF G GròÂhõqµûFE}<§8WÔëp,#@@@^hÓ¢~ãšï4,êã9Å¹¢^‡crròB›õïô®Ï6<~ÃÀ©÷ùcñœâ\\Q¯Ã±Œ\099y¡M‹úh¯=}ÿ€¢>S˜+êu8– G G /ã.Ë²ß[¿~ı¼şğ‡+çÏŸÿîW\\±{Îœ9YüSfÍšõÛ?şã?Şuİu×½úÍo~ó¼ıëI]ÔïÜ™müéwN½Ï‹ççŠúL«u8Ót½6\n G€¼Œ¨˜ôÑGï¿é¦›v_yå•Ù÷¾÷½ìÉ\'ŸÌz{{³;vd!>nÙ²%ûÙÏ~–åEö§ú§¿ı³?û³_^|ñÅM¶¢¾o[oöòš;\ZSÏÅkèŠúAœ–·my[Pû8]÷k£\0rÈÈËåÅûÜ¯ıë;¯¹æšjÁşşûïg­zöÙg³/~ñ‹ïÏ›7ï…óÏ?ÿÈ	_ÔïÜ™½¹qyö‹}¹aAŸZ¼&^kÔ^Q?HAŸ\nù©ßª°·Q\09ää¥eyM¾ïc=¶ü’K.É-Z4¤b¾ìG?úQ6wîÜíeÔ¾^QßltŞ¨½¢~˜}³Ç±Q\09ääe`A¿bÅŠ§.¿üòìå—_ÎFÃ/ùËì’K.Ù~ÑEıÉD,ê[lÔ^±®¨¯ü¿ùÁ\n÷ô¼sìm@\09yi,Fè£ säGS¼ßÅ_Ü×İİ=k¢õÃ-èSS¬Oú¢¾Õ‚İˆ½È G /Å9ô1å~´FèëØÏ={[^Ø=‘ŠzMQ?§U†6?Ô×c£\0rrL†¼ÄUî¿öµ¯íŠsèÇÒâÅ‹·Ïœ9s­¢^SÔ{ä=¾¯Oao£\0rÈÈK¿…şU\\åşÿñ³±vé¥—¾Õ©ÓğõŠú½\\ĞÖ÷c£\0rrò2QÄ(}Ü‡>n[7~şóŸïêÔÑzE½¢~4»(Şx¿6\n G G /lıúõóââx#¹uİPÍ;÷­üzx;üıİİİM:u_E½¢~úÑš:oÄŞFääH`²çå‡?üáÊ{î¹\'O,x6ÿ‡^İ&ö¼¼mÊ‹ûoD¯¨WÔ‘òEî~\'oÖ>Eùû\\<ÏFää˜Ìy™?ş»O>ùä¸õ?ıéO™ÿCµÃßŸò·Öväíy›ª¨WÔAA?½P˜?oYíc«…}£ïSØÛ(€“5/W\\qÅî7ß|s\\‹ú·ŞzkKŒ·É‚=¼PÔÛkyûÊùçŸÿOõ“»¨;àt‘zSä/¬æÙ\nûbAŸÚìÂóÎ±·Q\099&c^æÌ™“íØ±c\\‹úøy1*Ş^´ÿóE}j[óöİ¼MNQë‰\'Xm=öXµ;÷Üsû?ğÁ³x úùæÍ›³7fgyfµÍ=»úºı÷ß?[¹re¶lÙ²lÛ¶mÕ÷×/Y²dÀÏÛ°aCõ¹5kÖú{Å)‹/Şã±ø¾…Ö}}<şğÃ«÷ıÖ·¾Õ±E}¾ì—ä­//î¯Ìóò{CøÖF…v½}°Â¾Şëï©ózçØÛ(€“-/ñ‡·ßşö·©`ŞÙÕÕµ-ÿøfmdü…¼=“·ŸæÔòü¹Åùçæí¯òöı¼}\'ì[ùs_Qôüãò’·ÏçÏÌÛgfÌ˜ñŸóÇOÍûyûwùcÿ&/Ü˜5kÖ!yAö‘(Êò¯?·š¿ö_å¯9±IQŸåï±;ÿøëáÔ¿÷Ş{Õ…qd}}}ÕÇ‹EòÖ­[û_âu‡rHÿó\'œpBÿ€W^y¥úñÅ_lX°Çóo¼ñÆ …öQGU}Ï}ìcÙSO=5à€Cü.q áÔSOíì¸ã«8ˆ¯‹-<<ıôÓÕ÷ñX:(Ç)§œÒÿÚG}4;âˆ#:©¨¢°>lÊ×‡Ï¡ Ÿ6„B½^aßjA_.ìMÅ·Q\099&C^.¼ğÂß÷HıöíÛãê÷;¢ÀB»6Z~xàQˆçEùI\\pÁŒ=\nõü±y›|òùc×åŸß~úy»\'ü8\0P;°,Ô<Ÿ·WãÀA@È_·£Vœ½“·yû_y{¿AA¿=Ş7ÿ¾â Àp‹úÇ¼¿(¾÷Ş{ûîã?>[´hQµÀ:ujÿëï»ï¾ş.Çñºôq\0 Rb:ŠñTÇÁƒ“N:)»ä’Kú¿\'>Oïÿı÷Wóø]bfÀO<Ñ€!^Ï—J¤ï»ë®»ªÒkyä‘şÏ‹ïQ<`_ßtÓMı_ï·ß~Ù—¾ô¥!ıwîÜ™åëCZn/×–ï¢¼İ—/£oç¿œ·‹óÏÏk\"Ìœ9óßæÿÅgœ±ÿ(„cucQş3>>ÂÂºYa?Ô‚¾øó·VŒØÛ(€?/—_~ù®ñ>§~óæÍ/íÍsêo¼ñÆ}Z)ÚÊçQd¤¾Ra¢=¦ÑÇçÏ?ÿ|İQôh·ß~{öÎ;ïT§çÇôıt@ ¾\'>nÚ´©Šñû<òÈêÈ~£ß\'FÊ£ØÑóxÏ(°>øàêcG}tõ”€Ji¤?>Çyæ™=,¤éúñyüñyÌDˆSÒÈ|<7wîÜêççœsNõ Åp§ßçßûÏºººŠ?ùÇéù2šS›±ñçyû^şØÏ?®ÈÛ/ò¶9o»bê|ŞââŒ?ËÛãy{0owäíÆü{/ƒFù÷ı§3füûXæôGôáÒúÑ×à O<ş•80U§ oµ nTØï3Ì‚>q½ÈÈ0òrıõ×oï«ßÿøÇ?şŸírõûÚÂ0½ºŞ½ë‡SÔGQ\nÛÕ>à€ªÓŞW¯^]}ì¢‹.ê>FÌS|ë­·V§­Ç÷§‘û(Œ+µ)ğ1İ½ÑÏ¬¨ë­·ªï#õñ¾i&@š*Øa‡õ4ˆQütPâŠ+®È>üágŸşô§«~<—T4\Z/âÇ{Ççq€øŒç9õq±Ã(Ö£hâ=/ä»ó—EQ_+î£ÈÿqŞ®ÿ}µƒ›kšñfşŞŸÛwß}?5ÌBº^aÿÒ\núá`ÀFäää¥ÓüÅ_üÅ=ã}Ÿún¸aq»Ü§¾¶p—4uqQŸF®Sq{çwöûñu*²Sœ^£å1İ}şüùÙ˜sÌ1Ùm·İV}níÚµ{ŒÔ§‚7DÑüÑ~´Ú¢¾ûî»ûÏO¯}÷İwûNÿ© üb¡^o–A*öã<ûÓO?}ß¹\\ÔŸ|òÉFêã@ÅYgÕöÊ;ÿüó7®ÃSù›õqêÆ¯>ùÉOşúw÷w³|àŸæ¬WØ¤ /öÎ±·Q\099y™ˆ¾ò•¯üËË.»ì7ï¿ÿş¸]ü~ÆŒ¯Œàa£®Õ[–\r·¨‘ïTÜÆèx¶q1¹ƒ:hÀ¨vú:Î‰ï‰B9¦µ{ì±Ùë¯¿^}îµ×^p…û˜ÎŸ\n÷fÓïë¦§iüqÁ¼âkR&Ò…˜QŸ?ûì³{şi4~\"õ…àvËÃkçÕÇ lŸ}ö¹m„?.¦Ü—Gè_ª=>jïõ]¹ÈÈÈËtÕUWıïŸıìgã5õ>.h·ºÿOÃ-êc4>·1­>Ÿ^œ^.êSœÎ©¯Ô®š_)œSàêôûrQŸFêÓh}\\Ä.ëåÙ•Ú÷Óì‚õë×WŸ‹Ç*µ)ıéõÅÛíÿxm½ë´kQßİİı‡…B>î‚ğßòÇ¦Õ9=£ÙÕî›l¤¾•ûØ7b¤ŞFää˜èyùüç?ş¾ğ…İã0Z¿mÆŒÏÄÈød*ê+µ)ë©(‹Òzè¡\rGÌ+¥‘ú¸Jşgœ1à½â\"u1?¦ÁGK…yÌ\0ˆñt¡ºt½˜Ğ¬¨¯4¸Ç}º°_ñïˆ1JÒEò\ZııÅQüNºO}üój×YX¯·G·P@÷UÆæœúáöÎ©·Q\099&K^æÍ›·>n›6–âüı¥¯wº‰ZÔ§ó×cT½R¸j|q´:¾.¾w|W/NmO÷€/¾&.¶Wïê÷C9ØË¼üX½¢>]`Îœ9ıSüné<ÿÁŠöN.êóBş ¸õâ0\néVGÆİ¶®ŞÕï‡RØ»ú½ÈÈ0™òçÏ;wûË/¿<&ıúõë‹{Å·0Ú9¡ŠzmôÚŞ(ê‡©Õòf÷¡ovûF¦TÜ§ŞFää˜|y™5kÖÌyóæ½·eË–Q-èßxãŸÌ˜1ãõNv¯¨WÔC³‘òf}e˜…}:àlİ¶ÈÈ0	ó2sæÌ¹_|qßhØÇ}ô]]]_ìôÿ¢^Q?DFì[-è‡ZØ§Ÿ§ ·Q\099&s^òü³³fÍz÷oşæo~=‚‹çmûö·¿ıƒ˜rŸ·9áÿ¢¨WÔCŒØ—§Â_Xú}èëö³K?Ç9ô6\n G G€¼ôÿÁ‡Ï˜1cÙ¼yóŞzæ™g¶å>ô?şøC³fÍZÅëäsèõŠúQ,ì‹Ï+è­ô•&ßç¶u6\n G G€¼4üÃÏ‹â~Îœ9[æÏŸÿÜO~ò“×{{{ßŒ+®‡íÛ·¿µyóæ—–.]ú?n¼ñÆ%3gÎ|5ŠùïÔ«Ü+êõc <?\nòÙ•¡ß¦®ü}Óô6\n G G€¼4•ëïîî¾2ÿG<’·×ò¶#ş)µ›ò¶(oWÇÿDı(êõ£\\ØT½©ıØ(€ò‚¢^Qßæ…ıh ÀFäääE½¦¨oÁH§Ì›ro£\0rÈÈŠzE}öCiwQ<#@@^PÔ+êÛÀP§Ğ›ro£\0rÈÈŠzE}öSòÖ—·³%ÑFä#õŠúö1­V°Oäù­\nz#@@^PÔ+êÛS£{Sîm@\09yAQ¯¨ïÀÂ^Ao£\0rÈÈ£eÙ²eŠë½×väEıîI°š¥B~‚ŞFä#FÑªU«ŞÜ²e‹{/´ŞŞŞ¿Î‹ú&Éª6­Öá¸mÈ G /Œ–åË—ŸµbÅŠ_½ıöÛÛÚã7BıÒ¥K_ÏÛy:,##@@^¶¼°œŞÓÓ³.¦‚Ç9ŞÚ˜·ø?¿0™\nzerÈÈ ÃÁ299äĞá`¼\0èp,#@@@^\0–ÈÈ‘¼\0:,###\0eÈÈÈ ÃÁ29ääĞá`¼È ÃÁ299yĞáXF Grròèp°Œ@@\0yt8XF G G /\0:Ë##@‡ƒerÈÈ ÃÁ299yĞáXF–ÈÈÈ€Ç29ääĞá`òèp°Œ@@@^\0t8– G G /€Ëä#@‡ƒerrò Ã±Œ\099yĞáXF G€¼\0:,###@^\0–ÈÈÈ€Ç2äääĞá`ròèp°Œ@@@^\0t8– G G /\0:Ëä#@‡ƒerrÈ ÃÁ299yĞáXF€¼\0:,###@^\0–ÈÈÈ€Ç2äää˜4Ë¢è`š´uşS6\n G€¼\0í×¹LÉÛîÁŠú®®®éşS6\n G€¼\0íÙÁ,¤¨_;uêÔ}ı—l@\09yÚ³ƒ™Ò¨¨ïîî>ÛÈFä# ½;™zçÖ¯3Jo£\0rÈÈĞşÌ€sëKo£\0rÈÈĞ!ò\"~¡Qz#@@^€Î,ê?Q8—~šÿˆÈ G /@gu6ÕsëÒÛ(€ròt^g3E‡c£\0rÈÈL:Y–íûê«¯>òä“OşfÙ²eYOO6ÎméÒ¥ÙªU«ş>o³läH“#9’#9’#9’#yZÿêÕ«³-[¶d»víÒöRÛºuk¶råÊwó\rÁyv¢äH“#9²>Ë‘É‘ÉĞ’8’«ão›\rÀ®ìDÉ‘&Gr¤É‘É‘ÉĞ’˜š¥ãmŸ–wş»íDÉ‘&Gr¤É‘É‘ÉĞ’8÷G§ÛVÿ„í8\'òFAäHäHäH´‰˜#E=L Îÿ×¿z3{uİ²ç–~­ÚâóxL‡­ó·Q#9’#9’#9’#MQ´qçß·­7Ûğãë³Ÿ/¾fÅs:m¿(9’#9’#9’#9Òõ@›vş›ûÛjo<·H§­ó·%Gr$Gr$Gr$Gš¢h×Îÿ…\'¾Ù°óçtÚ:;Qr$Gr$Gr$Gr¤)ê6íü7ôÜØ°óçtÚ:;Qr$Gr$Gr$Gr¤)ê¿ÎßN”ir$Gr$Gr$Gr$/ÀhvşqUÔF<§ÓÖùÛ‰’#9’#9’#9’#MQ´iç¿qÍw\ZvşñœN[ço\'JäHäHäH4E=Ğ¦ÿ;½ë³\rß0pŠVşX<§ÓÖùÛ‰’#9’#9’#9’#MQ´içíµ§ïĞùÇc:l¿‚É‘É‘É‘iŠz ;ÿ;³?ıîÀ)ZùcñœN[ço\'JäHäHäH4E=Ğ†ß¶Şìå5w4<÷*‹×è¸uşv¢äHäHäHäHëÜåÙXùhÒÖ©  S:ÿ;³77.Ï~ñ£/7ìøS‹×Äkİµe\'JäHäHäH´-ê§äm÷`E}WW×tt@çßì(®£»:;Qr$Gr$Gr$Gr¤M¼åùX2HQ¿vêÔ©ûª  :ÿVâvtW\'n\'ÊN”É‘É‘É‘ÉQGõS\Zõİİİg« C:ÿávü©éÄíDÕ1­¶5MäHäHäHäHÚº°¯wnı:£ôĞA¿¦óe§åm[ŞÔ>N—#MäHäHäHÚ¶¨pn½séAç¯MŞ¨ÓJ;N12²u¢íHÉ‘É‘É‘É‘6‘r”ñÒƒÎ_³uZƒ‘Ó&Ú‰É‘É‘É‘i¬¨ÿDá\\ú	yº\n(ê5ÿà¦5ÙQJÏO“#MäHäHäHÚO:·Ş(=èüµÉ·ÕêÒ„!‘#9’#9’#9’#­Ós4sæÌwuu]–òämcŞŞ«ÖïÈÛkµ)ùWÇëTQ ó×&îNÔiCñêëåH“#9ÒäHäHFQÜª.o=yÛ5È=êËí‰üõ³TS ó×&ÖNÔpG:âûú:yGJäHäHäH´NËQ^˜æ?\ZB!_¯­>ÿüóTUÎ_ëü¨‘N]ìè©r$Gr$Gr$Gr¤uRººº>;cÆŒÿS,ĞgÎœ™}ãßÈ–/_ıİßı]öÿğYxï½÷²ŞŞŞlÍš5Ù‚²Ï}îsåÂ¾Ï¨=èüµÎŞ‰jv¢ñ~9’#9’#MäH“£Æıô¼¿XÌ?ğÀÙ–-[²VlÛ¶­úúø¾bqŸ¿çEª+Ğùëü;o\'j´¯\ZÜ‘#$r$Gr$Gr$Gr¤uBb„¾XĞ_uÕUÕQùáˆï»æškÊ…½{Ğùëü;hõ)_TèwòvaíãP”¿¯ã.V$Gr$Gr$Gr$GZ»ç(Î¡/N¹¿á†ú§ØWLÍ¿ùæ›ËSñVeÎ_çß9;PÓ;BßÏ[VûØêT£ïë¨)9’#9’#9’#9ÒÚ=GyA¿´8B?Ò‚¾XØ—FìW«²@ç¯óï¬¨Jmd#+´Vv¤Š;P©Í.<ß1ç4Ê‘É‘É‘É‘ÖÎ9ŠÛÖÏ¡î”ûÁ¦âÏ±7\rtş:ÿöÕhÇ¦ŞÑ`;Rõ^O×wÄ9r$Gr$Gr$Gr¤µyQß“\nî¸ÈİXxè¡‡ŒÖC\'tş±±[»vmöâ‹/V?ß¼ysİ×=ıôÓÙ¹ç[m³gÏÎ{ì±ìœsÎÉæÎ[ı|áÂ…ÕïìçÌ˜1£åßëÈ#Ì=öØ†Ï¿öÚkÕ÷|ê©§ªS„î¹çìÀÌ®¾úêêï“ş®ôú\'x¢ÿ÷‹ç£Åß‘Zú{ï½wÀï}Ë-·ìÑ™Çß¯ÿğ‡?œmØ°a¯wşÑ©çíG°5m;Fõv¤Zİ*ïHûÔÇVÿWr$Gr4ş9Ò:¿‘#9’£ñY7fÎœùñtq¼MçwÆ¤¨«â—nww¸jÚ¬¨OÈ§>õ©şñ‹.º¨úùA”İzë­ı¯=à€²³Î:kïÿØÇ>–M:µúy___ÓbäÔSOmùwûèG?šrÊ)ƒ¾&\n’•+Wf?şx¶hÑ¢jÁôÌ3Ïdo½õVõç­_¿~Àï°xñâêÇ(Nâ±(Xâë×_}×ÆûÆÿá¦›nª>ÿğÃWÿÖh©`‹ÇãÈèŞîüÓ¢zººº>Ñâ·µº#ÓlGj¨;PÅŸ¿u¼GHZı_É‘ÉÑøæH›ÅˆÉ‘Ïº‘?~Yz]4KqûBQµjÚ¬¨O½4âŸ_pÁıŸïØ±cbdÉ’%Ù¬Y³ª-^#z‡vXöÕ¯~µºãß¬9øàƒ>;øQ¬D‹÷Şo¿ı²#8¢ÿw{ä‘Göxÿ5kÖT¿¾ÿşû«EUúGuTõheñ½_yå•êÇ­[·ö4¾ñÆÕïıÀ>P}ÿø»£¥ï‰â*~Fú:şöô36nÜX}.=Ö.¡-ir„w¨SíHí3Ì¨òÈÌ¸íHµú¿’#9’£ñÍ‘6±Š9’#9\ZÛu#ì‘ôüŠ+Æ´¨muáwY¤Ú‚6*ê£¸ˆ©¶1õµ8Õ6¦ÍÆà(Ê¯Æ˜¢_ÇÇxıüÁ4aŒ¢&ÛÿııŠÅOyô.–‹‘wß}·ZÄç×_}µ‰Ï;î¸jÁ‘Š‘x,¦øFQ©M\'œpBõo?äC²3Î8c@SŠÓå…LÅH|Ü´iS»vşıGxëì ÷Âz;R/`j¤¿Ï˜ş¯äHähür¤MèbDäHÆ`İÈ¿Ş˜íä•õööMª-h“¢>v¢£xˆğTL¤ïÉkT¼§\r_wİuÕÃøØ¬ISscD²Xp4ı,#ñ{Åhfú:Î¾ï¾ûª#Š© HçôŞ~ûíÕóˆ¿ô¥/íñ~—^zia‘\n”(¼Òbüi´3Şç˜cÉî¸ãìCúPöè£VşÑG]}~Ù²e¦\Z·[ç_<Â[›¾5Ò‘ˆz;R#Ù*ïHMk—ÿ•É‘O´ÉQŒÈ‘ÉÑè®yÛ¾­ÛØ\rv{»ÂÏŞ¡Ú‚6\Z©;Ø1êwå•WÖ6Ï×+Fbç<Î•)¾Q\04+F*µó€‹Ù\Z¬E¡Q©MíMEáóÉO~r×‹©øùÅŸ—ŠŒòï‘F	Ó4çâc±ØŠ‘Ê(<N?ıôşiÌiT2Î=Nï×lêpó¸´Ï|æ3iggÁW±}êŒˆ¼T{|$´Ëÿ*šÉ‘o´±or$GÚÄÉQ±‡âÏSmA›õ1Ê;Øq®¸:v|Sncƒ£rÅ«X§óaÓ¹ÀqÑ­´£#€ñºÁŠ‘4e8]\r;>Ÿ?~ÓÑÅÙ«7…·Q1ÏŸ|òÉıŸ©˜æ_Çãé÷Œ)Äñ¿J_ÇEFŠ#†1¹\\x¤&|VÚì_uÚº®®®éS§Nİ·öÒfWÉÈH+÷\rnç‘‘=şWr$Gr4>9\Z¯;HÄ¬’âï¯¹ùæ›ëşŒX_ãùŠSVÒÏ9óÌ3³9sæŒj?ç[ßúVÓ×Äé=ñy\\l2ÍÔi%;r4¹rToÛqâ‰\'V[ÚEvÒç>ø`uJ™‹~>Öóhi½ƒÖq\0:fVÅ•ĞëŒ¯¯½öÚëmÌøŠÏ‹—‹3ÏbÆ[ºxjq›Û×z¹L×~Iï_¾ğl¼_º†LlËâÚ5qØâ,´Jí:2:Rß¿näŸ÷©‡I^ÔG\'_œ¾ÅAL¿saëÌE‹)³iÇ?vÔï¾ûîjÇWµ¬)Ï>ûì j\Zå¬÷xL.>¿Ot0åG±)~ÿI\'TİD§¦GQã*áqÅïâ¾RSÜÈÄÇØ©ŒW|şüóÏ·cç_Şy*ï°ôUÆæÆáìHíísëş¯äHäh|r4wH¢0)l«÷ºø™±#[¾FEñt”¸CDº(eF‘øˆÈè?øÁw„HÏÇì–8È—\n‘È]\\Ü²üûÄµ;Òç)÷•Ú%Ú¼‘£qÊQ£ëq´tÀ+ÍÈ*®;qÔôÚt9ÖÍô|šU)œvU.°‹ëhºfJôíQT—3Y<èœ2ï›®çÒh½®ÔnÁšîÎ\Z\ZOÛ°Jé”¸¡æ¦]säœzPÔ˜›Î}‹bÅQÎx,¦è¦N>ZŒFÕUWõïŒD1pÉ%—ôïˆÔë´c¥üsÓQáØ	K‹;>qt¸8\Z’Ø‰×¯^½ºîßï—Š‰¸‚x½Ÿ›v„â|ä´Ñˆ«´1‰\rOqÄ$íô¥\rFq#?¯|eğ6éü×vwwŸİ`çi$#nTïjÃCÙ‘Ú›Wô%Gr$Gã—£ÊßA\":E¶âô“4ò_GöŠ¢Eá“~ïâèc£¦‹]Æˆ~z]ä<ˆ‹õüĞCmXPêE‹STÒƒ4(õ%)ÃÅ;U¤¿7Œ“£É½=j4ó¤x×Jí´¬ã?¾ZpÇA¤tP,Zø-f2Öã4ÚÅ6-+®£wİuWõÀvä3®S|mLKïÛ b^â\0oñ€oš•RÎpæiV\\*ÚãÎ+õ\nùbNÒÄ4;®Šú†ë†«ßƒ¢¾º#;3Å€˜šUìÔkVÿ¨^œÿ…H£÷,DAÅA£ÑÊtA­x}üœØ¸ÄëëqMG„Ë;^±ˆb\"6 iJrñ¶^å‘Ê89vãoO÷İNHºZwq„q°Ï´1j£Î°‘‘H4»ïo³û72¥²wîÜÒÿJäHÆ\'Gãq‰ÈIù}êú§ÿtp-×•ÚTã(ÆãóÈAy}NEB¥0s%¦6§¥»<Äï-ÀH§ÄAƒòé1õFA#çé(È\"Ãr4¹sÔl¤¾8ÂÛ£tÀµQAœE_¦bÛ–¤>¿xç’T¸Gërš…–f²·kéàpdKÛÃ”«øxçw˜­’¾¯|PºR:%fÀ¥Ÿ3g\"ké F|L³Ü:`¤¾éºá>õ ¨×&ØURG ÙÈD³¨Ê0w¤Ò”Ë³åH“£É›£ñºƒD«E}:QØGq£˜QœÇkŠ£Œé\"‘qÀ¡X@DÑÓ‰Óï^i0R_o1(Ş=¢üú©O#šé÷©Ô¹n†Ù•>§u4Ö¹X¿â nÇ•Âi.ÅƒUé\0pÌ*‹ïO#÷qğ©R»ÕiñÖªé A*ëİ¥˜É8(n§Zœ.xô	1ë&NÅ©w¹Şµrú€â¶tÀ.e¨İ‹úVÌœ9óãy½;\níüóê²\ZÑ/Îš5ë·…¢şpÕ(F#í§ÑI«;PCİ‘J?ïl9ÒäHÆãiFKœæ¯+^0+~fyšo<{\0Q|¤Qõ4u?š^ñb©\0‰‘úx>N9)\"ÅëL¤‘úòİ#¢‰Ùñšù¬w@ İÎ©—£öÛ¥sè+µQğTìÇ×éÜôò9ç±îÆhz\\+&No‰[“ŞvÛmı•*…‘ú4*Ÿ\nõz§x3™fD±YIwñ\"­å@¦L¥ê3\\o¦J¥Áôûtº\\œN0¶GqßúTlÇÿl,<ôĞCÅQúÕ*-˜àÅH¥våëb§7cÆŒj§Ó*cG©üúØ@”¯’İhtf¨W\n¤ò{ïÿMìD¥’òÔÃ+C¿ïo½©ÙC‰™9J£xi\'ª|àÔâ5å)é•·•+^\\,vvb\'+Š hÅT¤sÿczozM£×µcîähbæh¼î #ƒišq<çŞ§;:”ó˜şçQ˜Äbšæ_irñ®ôó‹ç/Çï·s,O©oµ¨‚+@ÅQÇzÅJ£~ElbİOëZŒºÇz…p\\„²Ñ…äbêz|O¬ó±{ì±ı³TÒ¹ï‘ÉÈHLÓOëb|ÎÃ/ogÊ£úñ3cû³hÒÔûx¬Ş]bÚ|l+µÓb&Md%ıoêå8N	‹ß)HÄëÒA‰‘\\ù¾\r‹ú³SÁ£õ£}Á¼x¿|_¾”>ÿy³TZ0A‹út%ß¸ĞOÚéI·\'I·$ªwÔµ\\ÔÇ×q?ëFï?Ô+Çm‡¢¨H¯M£4éóâU[õ{ìàL«³CÔÊT¥É÷Ûm‚Ú)Giª_ÔiİìŠÛ1-29iD¡xû¡âñbG(\nœØñOÓÓNOñuÅ{ÔÇˆf½Ÿ[Îg»åN&fÆã1š…vW\\qEÿÁ¦(¢8ˆÅäòÏ‰b ˜—ÁŠúÉŒ÷ÜÄûG;]£ŞÈG£sœ‹çÔÇïV¼¸XBõ¦<Ë‘íQ:8”úà˜VŸÎ//*õiLçÔW\n·2MçÔG®Ò€Mqm6ı>½&Ší¸K<ÒçƒR’Öÿâ¼ôxä/]Ï\"NyI·ß+ó_)\\,¯xM€NŞåÅö©èkŒÖííb?â_øÂûÅQú!^+è¤¢>:ùb‘’vV*µ«\\ÇsÅ˜bÏ¥¬ØÙjÔ·z¥àt–¸\ZjUÄØp¤\rE+ğšÄE}qGgza‡hveè·*ßHïGÜ±9ª”f°¤â¢üº9ˆ‘¸Qä&F-Òz_od¡¼sEvìPE‘é¥—Ö=®ZŸ®¼_A‰÷)t´[îähbçh¬î ‘fÇÄ¶&Öı¸Z~9wÅ‚#DÆûE±\\¼G}ù\0[i=DÄïŠ+~o½[D–¨zÛ×”õt±Í4Ê™ÎC¾á†ÜjOlÊëXºëH´q€·|G†ÁFêc›•.„Z|¯â·Ô×G.RXo¤>e&îÒ’òzÊ{:¿|áÖhqêK0NÛÒ”…È~¥p!Øâ=îÓ#\'Åƒ¸uhQxŞ¶¦ÿ{ü­#-ìcßáæ›o.Gß×İİ}´*&pQ_¼‡vš’•:êÔñ×;\Zš6•Ú…K;h0”+§âÆJíŠ§is¸Gg\'A1RoGj4F\\ÆıªÂí£F«âñ‰/ŸSëtì°ÄÎLì §ÛoÅ–Ø©¦Ø¦÷ŒEŞæÍ›W},]¸«ŞÔıáŒ©üûDÁ“v|Òû·[îähbæh¬ï Q¾U]±H™Iwqh4“ Õó•[}ıPŠúÔ7TJÇ+^¸Oäh°–f¤\"8İb®8#¤R:MªR¸\riš._ŞO«”Î¯ÔNãª7K¬Ş9õ©Hß#~vÜvµ<Ã->Æ¶)ÄãÁîS¯ENb;Züâ}£H­NÃ™9êêêúlºh^\Z±îTüø¾Ò½i÷0Ñ‹ú4ªS¨bºTìlÅHQˆÄó±aˆ¢#=£½©HˆNºxîU|n™’¦îõJÁ©¸¨Ô.„cT\'EîÑ­¨“©ÑŞ!ë˜Åº#Åó\nÓ:£1¢P©À§ÅH}.åLDÒˆ|ñ1ÒRœÎŸF4*…ókÓm{Š;AéÖ>ñ{Å•…ãÂñ»ÄÇ5)Ï h§ÜÉÑäÌ‘f{$Gr$G­É‹ï9ÅÂ>Î±Yq`¤Õ«ÜÇEñŠçĞGëêêú¢ê\n&Aç#-QÀÇÅ€b§?¦å¦«”¯…@ñüÉJmJdL×jvm¥Å‹\nEK÷ŸÅP7éHsš£4v¢Z\ZÑÉÅ›â8Z9Š\"½x._qêa*~Ë„,‡#© O£tid#µ(îÓ4å(ĞSŸfÉ¤â>ŠúXÿ£OÓ)‹çÊWj÷\"N·â*ßw¸]r\'G“/Gší‘É‘\rMŒØçm[±(â>N\\±bEu>MÍmtooou_ü/ÿò/³/¼ğ7Åï‹)÷q @e“¤óOçÄøTP¤‹oUš\\(¯R¸ÍÊH‹úx,ÎKSÇÒT³(ŠÒô³ò•øíD5İ\ZêÈFG]„h¬sëÜµ×^»Çù}å«Ü7:·1¤Qùb‹qñ\0Yš®˜.T<×>½¾Ñ¹“Å©Ïíš;9’#ÍöH49j.Î±/Şên˜mµsèa’uşéüÅâÎ:·>\n(f*¥ó·ÊE}º˜QŒ8äJÁñs£x‰vEbÔ0KS‚Çûby¾UÜ!š>F¯ŸĞ9JëvZ‡ãÜÀJmD½Q!FêÓhzÌ~‰‘ïâë¢hu:Ş7](Šê˜öŸŠöt ­|[ Já\nüƒõí”;9²=ÒläH“£!÷çÕŠûİC)æctŞUîavşiä1ĞU\nÈ‹Ñù(j\Z/q.oœÅ}¸òÊ+«ÇıŠ]T«Òä¢Bé53fÌØ£¨JWÏÏ<óLÿØìHMÉ[_ŞÎ–£ÿ?‹%®JŸFÊã¾ÀÅµRÔW\ZÜ/]1<]Å7ÎGv\"[é\0[ùûâüù¸€P\ZAotUîvÊÙi¶Gr¤ÉÑĞÍœ9óãyqe^¬?’·×ò¶£VÀÇÇMy[”·«c„_:ÿº;ø¦o™R~<F0Ë£’Ã).âÿ£¢õ~Fe/˜7Av¢Â´ÚÒ´Aß:v F#GQ„ÇÁ©TÌÇTù¸%\\¥ÉUà+µÍÕ»ıc½×Ç(~\\Ï\"Öõt`-µxŸFâ÷I÷÷ne}oçNl4Û#9ÒäPÔk:ÿ±!™SåHäHäHäHSÔ:m¢wşå¦	·%Gr$Gr$Gr$Gš¢Ğùk¹óO;N&â”É‘É‘É‘iŠz@ç¯MôÎ?ÎYÌ*|› 9’#9’#9’#9ÒäĞùk“¹óÿˆir$Gr$Gr$Gr ó×ù#GšÉ‘&GÈ‘èüuşÈ‘!GšÉ‘&G€Î_ÓùË‘&GÈ‘!Gš:?r¤É‘ir„É€Î_çÉr¤É‘irèü5?r$GÈ‘!Gš:Mç/Gš!Gr„É€Î_çir$Gš!Grèü5?r$GÈ‘&Gr¤É ó×tşr¤Ér$GÈ‘É ó×ù#GšÉ‘&GÈ‘èüuşÈ‘!GšÉ‘&G€Î_Óù#Gr„Ér¤É ó×tşr¤Ér$GÈ‘èüuşÈ‘&Gr¤É‘Yå˜l–-[¦ÓmŸ¶#ïüw[+åH“#9Òä9’#€–¬ZµêÍ-[¶èxÛ õööşuŞù¿`­”#MäH“#äH\0Z²|ùò³V¬Xñ«·ß~{»xïÉéÒ¥¯çí<k¥ir$GÖi9Bä ey‡3½§§g]LŠs´qoñAÇ/GšÉ‘Ér$G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00ªş/E¸>KÈ\0\0\0\0IEND®B`‚',1),('142502',3,'source',NULL,'{\"resourceId\":\"142501\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\"}],\"bounds\":{\"lowerRight\":{\"x\":116,\"y\":99},\"upperLeft\":{\"x\":86,\"y\":69}},\"dockers\":[]},{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\"}],\"bounds\":{\"lowerRight\":{\"x\":261,\"y\":124},\"upperLeft\":{\"x\":161,\"y\":44}},\"dockers\":[]},{\"resourceId\":\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"}],\"bounds\":{\"lowerRight\":{\"x\":160.15625,\"y\":84},\"upperLeft\":{\"x\":116.609375,\"y\":84}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"}},{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":334,\"y\":98},\"upperLeft\":{\"x\":306,\"y\":70}},\"dockers\":[]},{\"resourceId\":\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"}],\"bounds\":{\"lowerRight\":{\"x\":305.375,\"y\":84},\"upperLeft\":{\"x\":261.390625,\"y\":84}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('142503',2,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0€\0\0\0®\0\0\0?ÚM\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0ßIDATxÚíİ\rPÔg~ÀñvÙ_€cÀpÖDÍaÅ\Z£ÉxÚI‰’œ‘DsMft\nh/™$4ÍÙIt\ZcÆ¤^LœÖ¤Éµ—Ü%Ú‚\'¾E41*Ú9œp±çÇ&©Rõ„Uy•=İş~pö<ö…åû™ùÏ²ËîÏïù=Ï³Ïÿù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÀEPE\'úÔ©S?illÌ¾råÊØ¦¦¦h·ÛMÁô6à#\"<v»ı’Íf;ØÒÒ²*--í7”\n	\0ÒğÿCuuõ›.—kPrr²‰‹‹3C‡5‘‘‘N/i•¤jêëëÓé¼ÚÖÖöMsssvFF†ƒÒ!\0AuæÌ™Â“\'O>vÇw˜áÃ‡k•Bñ£ÊÊJSQQÑ,#®y>øà6Jd`±P¥Æ_ÇÆg’’’hü@GV			Q.\\˜]–——wœR!\0¥Ó>Ò]¢lll§ïÿ±ñ¼q~½Õ8¿ÙfªOıÆ\\¹|ÊØ3V{,…×K6›M“€İétÎš?şüüü”ÊÀÀ¤*‚N?ğÕ9öé®ñ?{ø¿Lcõ1ãn»j<îVs¥æ„9shqÕŸ£\0ûÀàÁƒÍ¨Q£Ü‹åç”	\0dïÿ\'ú¯Îùw¥æô¦õjS§Ç5TŸ*¦\0ûÈˆ#¬Vë˜={öü5¥A\0B—zêjŸîæü›oĞË×ÑúÎ°aÃœr3‡’ \0¡ëüu©gw<m-İ¿ØÃ¹})11ñ/ä&’¬‚MOòÒÕ(>ù?|Wn’(	F\0@@èÉIœä\"\rÂ·ÿ:†$\0 4DÅ|§û!¬‘@@ØJ¸ã>cµ\rîô¸%*Æ$ŒL£€\0\0ÂÕ¤qfpâØ.:l<\0ÎÚZš;=ÖúÇ\n  \\]mºè=ã·ñâ7¾×t©ÜœùİŞç\0  ŒÔU–ÆµwßŸî\\©=m*¾g.ŸÙo<œ\0Ü–{!${ıçîíá÷„n	¡ÏoQÂ°¿œe¢½KÙ0@¿£=ú6ş2\Z‘Âéÿù\0Ğ_işVéN¡\0z†) „œÔ¹À\0\0@\0\0\0\0\0$\0\0À-âCà Òká–••ıı‘#G~TUU5©²²rP}}½Õår«Õê:thKBBÂ¹ØØØıòôŸ-]ºô¥Üšùóçhmm}<\"\"bºÜ$G²CäpÉá”x<*ßû­Åb)X·nİH\0ğ[ÃÿÉ\'Ÿ¼Ÿ››;ïÒ¥KÖqãÆ™ôôtsûí·iğMtt´‘$ÑĞĞ`;{öìh‡Ã1úğáÃ?zá…Î455å¾ÿşû«)E gæÍ›÷¸Ü<çv»§Ioëâ)ÑrŒ’ï’ÛÇÛÚÚş-++«Xî¯Y¿~}>	\0}æÀO¾şúëïÖÕÕÙ¥’™‰\'\Zéqt®‘’ôHJJ2÷Ş{¯Y¸paDiiéÈ‚‚‚_æää,©©©ùá¦M›şº&ñ¥ú/¥Ã•q/O—×¥Ë{äHBx\"\\c¸^¿uûöíEk×®}`öìÙæ‘Gé²á¿MrXvïŞºqãÆß?óÌ3ÿÄh\0è,333+22ò]éõ_»šÆÛ]wİe¦NjRRRL||¼^S¯ImjkkMEE…9xğ ‘Ñ¶ii¹vê4yİE<£@€\Zÿ}ûöíß»wï÷/^lÆŒÓ«÷ËÈÈ0©©©1+W®üùSO=e_½zõ/(eàZãÿ¨4şùÒø[:\Z~ípÍœ9Ó;¢¾Ş Aƒ¼ÇğáÃÍ}÷İçM;vì0;wî4Òû×§‘şX’@´$°êp±\n(\0´ç¿eË–ï¿òÊ+½nü;Œ9Ò¼öÚk1RÑWJÅÌ¦”k=ÿBi°½¿6êo¼ñ†~\0Üeãßèóõuú¹œOGîƒp‹5€Ÿéœ¿ô$X´hQ+`Oéû½üòËC¢¢¢şC*f*¥Lçü¥·ÿnGã?vìX³bÅŠ?iÄo†¾N_?aÂß$ğ^8Å\Z	ÀtµOQQÑ{:çßW=ÿ®FÒë±K¯çCJ™ÄÀê9íù/Y²Ä;Çß:5ôüóÏû&ú€€?«°°p.åÔ9{š5kVL\\\\Üh¦‚0PéROiü _ëœ¿6Ú½mü}“€à}m¤…K¬‘\0üØûw8§K=£¢¢üşórrr¾#= ç‚4ô^®˜Î¢«]«ûúï­NûtGßïÑGõïœp(wÖOôß.Xuéf Ü}÷İ6»İ>ZçA\n\n*üçşLÂÜvÛmòó#\"\"Öµ¶¶–lÚ´©‘š€›©CÉÉÉM™™™…ºŠ§§uHÏğ•Şÿ½M\0şğğÃ›Ï?ÿ¼c‰hZbĞèöİäå/&Lp~ùå—såËUÁø›¥á×Óê³%³%€k¥G·]î¯—ÄT¼víZµ=0XêÑ|©Có%vê¥‘İ&÷}£:Ô¾½ƒ7Ğ4æôlzĞÕAzR¦ÄXÇCA‹5@ˆÓ½}t{‡@š:uj¼TÎé¡P)% ã%ˆÊ—].W³òyl›”ËgÅÅÅ\\¶=+Ç©G¤¹¤C±Qîo½¾µïíã5eÊ¿şBúş>	 $b‚tc7]¡HwŞyç óí&W¡&FK ÿX†øu’vIĞ®ed€›İÑ¡:¤#ƒ\"İ«Gëä†I>1à×_bÔ¨Q¾w\'õ÷B%ø‰îê©CÆ@jiiI’ i•àXÂE\'G¦ü™ºëiffæ‰‹/RaBDuuµw+„¯C:2˜+uh®Ö!áîø†¿cîº÷O$ KZ1u3·@:pà€‡õú/ı¥œä÷ıî¿2gÎ*Møâ‹/ôó+ÓŸêñYÍØWK?»£KB}G%$\0tI†¦İÒ9I`Ê”)Õ›7o—Fõõ\0ÿ¹=i,®¶ßÚ®K\0\'\'O|\'5&4ÜÿıæôéÓš~\Z‚u¨MzıöNorËÃŞ$ĞĞĞà×$ ÇùöóH\0èzŒ\ZÛR[[kKNNØÏŒŠŠª‘`ptø••Õ]ğ6k`Êïdïhøå~­Üß«KE%IîÒÏ\0|òI5&4$&&zWº,]º4$êNiÊ»}‹ÜvªCÒÑ*“ï¥èóu#7&\0}Õ$\0t)>>şŒô¤R™\0ÊÊÊNh/)Èº®Ûc°1\Z°íí’cCLLÌ^iôk©!ø3£Å¶öúcõ©W]Ö!IG;ÀÉ“\'ûü$0_ºe´£$\0t7Øçp8Rtïñ@Ù¿¿ö¤÷ùOâ°›åØı«}pl7S‡dD°O…®É÷îç?}út¿ıbúş>öõ÷‚&øI]]İ2x¢­­-2@\'ƒ¹ÊËËu—Âç‚õ7ëĞ\\nŠ###?j_âIO~¯CV«µPâìßõËÒÒRSSSã—“ÁtúçĞ¡Cö®iON$\0t–››{bñâÅ§¤B~OçTı­¨¨h‹Ûí¤SÓ_‘X…ôÒ6ÓÓG ë^À}Ş¼yÅ’<fè\\ôB.ºŸ_Ûµk—uÜÑø—ô÷m H\0ş,ûµ˜8q¢ÕÏ£€Ú>úè¯$€Ş\nÆß)ËA®CzU¼ú…&€iÓ¦õéggÏ5Ÿ~úéµŞ¿ÄÚ¯Â¡ÜÙ\rÔÖ¬Y³©±±ñ­ş´jÕ*íı7UUUPêˆÖ¯__(7ÅúµŞ~ûmï’Ğ¾ K?ßyç6‰±k½ÿp‰5€ÿG»uëÖæòòr¿¼YYÙöC‡Í–ÉÓì±ƒî	Ó¾4³²²Ò¼ùæ›½NÚøK2ñœ;w®cßN±FğÿĞ¶âêÕ«OKe¼Ò×[H¥üíÊ•+\'I…ügéı/¥kg‘|émœ;æ½¤£NßÜ\n}İ«¯¾Ú&¬¿Nı<N±F€üüüu‹–/_ŞØW#íù¿øâ‹·Ëp÷=©ù”2`Ì†\rtjæé$ #eË–éÅ×ŸÄÕ-}$óÒK/ùöüu…Ò²p‹5U&0¤Á>’’’rª¤¤d¦Åbi3fŒ-2ò–òoí[o½U }ºTÈårûŸı½l.\\¸\"Ğ;§¢{ºÄÇüÓşúû;£ãÇ×Öé±ë.¢æøñãŞU<\'NœĞ•<ŞëthüÙívï4Î%Fõ2®æÃ?tõÕWºëDû[êù9ák×cP€{\'YYY6nÜ¸fçÎãsrrbï¹ç˜¾ÜµgÏÂ¼¼¼©À)R±`Ú¸q¬Iœ| ËCõ1ıpXw:Õã&fFJtÎ?\\c`ík‡ •sîªU«µÙlRSS/¦¥¥\r=z´-!!!Y7knn>/CÑº¯¿şº\\F\r–òòò±RGÈkát:óùÀèQ¬=¤±&x$‚ô›hóJäXî±F^åÔ³7ëõLKKKç=zôoäşdóíƒº…¨î›¯ÕµÇÿ-Ç³ápâ	ÌXs»İzXKn59]=¤{ûèö›J¬‘\0‚LÏb”›·Û\0ÄZÀ°\n\0H\0\0\0\0\0€\0\0 \0\0H\0\0\0\0\0€\0\0 \0\0H\0\0\0\0\0€\0\0 \0\0H\0\0\0\0N%ŒŒô¸İn\n\"Èÿá´i¿.H\0€ßEGG_hhh  BÀåË—æÛ£€\0ø_TTTI]]œNg½ÜS$\0  \\.×¿VUUµx<\n#¸*jjj&ÊíŠ‚\0Ä´iÓJãÿûÊÊJ\n#ˆÇù?T>ôĞC(\r\0ÈQ@vEEÅ•úúz\n#jkk·Iïÿ‡n·ûJcà°PùùùÕ,8xéÒ¥Çâââ¢ív;…ÀÆ¿¬¬lBDDÄ?Îœ9³„!\0———w2;;ûwçÏŸ\\\Z£¦ØØØ¹¥`ü§Âápl’‘×ƒÚøÏ˜1ã3Šd`!ºrvïŞ\ZùÕj½\'))é‰‰‰ß•QA²<Fáô’®ó×¥ºÚG?ğÕ9öÉÈÈpP:$\0 dM’éù2]ÉrDS*½¦\'yé:ÿb9¶ğ/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿiüV1ìW›Q\0\0\0\0IEND®B`‚',NULL),('145002',1,'new-process.bpmn20.xml','145001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"process\" isExecutable=\"true\">\n    <startEvent id=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\"></startEvent>\n    <userTask id=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"></userTask>\n    <sequenceFlow id=\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\" sourceRef=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\" targetRef=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"></sequenceFlow>\n    <endEvent id=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"></endEvent>\n    <sequenceFlow id=\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\" sourceRef=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\" targetRef=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\" id=\"BPMNShape_sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"86.0\" y=\"69.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\" id=\"BPMNShape_sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"161.0\" y=\"44.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\" id=\"BPMNShape_sid-6671953E-684E-41C2-8C80-8BEAD9289719\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"306.0\" y=\"70.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\" id=\"BPMNEdge_sid-BA3E24A9-4796-4754-BC74-659051F2504D\">\n        <omgdi:waypoint x=\"261.0\" y=\"84.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"84.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\" id=\"BPMNEdge_sid-01195158-26A2-436D-A9A9-B148E4CA82F9\">\n        <omgdi:waypoint x=\"116.0\" y=\"84.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"161.0\" y=\"84.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('145003',1,'new-process.process.png','145001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0\0†\0\0\0˜/’«\0\0ŞIDATxÚíİİOSgÀq/¼ğØ…É–Ì?a»ğ0Ù.$  $V(¢$dJ ¨4†Ä-YLHŒ†…%Æ cL^\n–WÉ˜˜„6DÁ2†Š+È³ç×Qs, Ğöœ~?É7Šbì9ß>}z^¶m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˜B)µ}llìfOOÏÛ––ÕÜÜÌ°x¸İnÕŞŞşél‘€ƒH\\;::”×ëU~¿Ÿ£133£ÚÚÚ^èØîe«Bf®ÄÕ6‘õëí0[%à²,@Üì3t`—Ø*‡5@Âf«À*¶J Áûêù”\Zë½¦†Ü¥!ÿ-_#Š@Ÿ›T\Z‹Ô@}Á{C¾&F ÌÀ>úyM\\ƒcb¨0X\0ávønù†•Ç#f`4—lXyŒ0X\0–À°W`å¨+F ÌÀv}¿a`å1ÂH`„ØÙÉAõ ©xíò€şš<F	,€0+ãáï7ÖV¾F	,€Hûúµ\Zíşaíò€şš<F	,€0+gjt}·á\Z¬<ÆÙ\\ÀV«g¦S£­ê†o7ŒkpÈ÷È÷2›%°\0>ØÍZ™ÍX\0av3³ÖÍf	%°A`ÃkpJ`Ü&°\0,@`\0%°€9”R;]×¯_o+++{qìØ±¥ÌÌL•’’¢ÒÓÓW9â?}úôXyyy•ŸX\r_ZZÚ\'ÉÉÉ9zÿº©Ç¨ó²¯é±¨ÇCıXşõ”|uŠó°ŞºuëÆÙ³g—òòòÔÕ«WUOOšœœT‹‹‹JÈ¯^¯Wİ¿_é\0«ãÇ¯œ8qbüĞ¡CÙ–A`7oß¾}_ëÑ¬‡5¨›wõ÷§S«8£CšuîÜ¹×x.//«ÍêïïW………Ë.—k8))é3Ë °Ó‘Ü©#Ù°…¨®7:œ´¯9yÖº½¶¶¶õğáÃª®®nKa\rÕĞĞ ²²²|N™ÍXmúí~Jjjê¿ÆXê·şêÂ…ªµµU=~üX½|ù2°?-,,Ş=vuu©ŠŠ\nµÿşĞÈÎ3›µy\\=Ïo¹¹¹jddDEÃøø¸Ò±öeggC`ö½¸îÑA\\6†µªª*°ä¶sssï—ßg­ş3³©™\rÉÌUâºÙ\'x³äÏÓ³Ø¸u%°6š3Wc\\óóó³ÕpÈï“¥¼È2“µÛš«,DkæºŞLöÀsú‰ßE`‰XYs5.¿[—,œ?>t¹`e³ÇÒÀÒÒR¿¬¹š©¾¾Ş§ßÎÜ#°ŒD¬«Û8s4®ÆÈ†Ìd;¨›\rÔÔÔü(OÌ›7o”Ù=:¯o_,”Še\\s\rwYàCËÆ5Y–\nl0{•ã\\åP,+øãuK`	lÛŒŸ|@e†êêjf±v!ghÉ[‘µUYYYÓ²e§^/	,5s’3¯‚lÉ,svvÖ”ıK.9„k\'¥‹9ıµ²²RY©¢¢¢_Nõ³Ñ‡Á·SÍÉÉÉ_XkÆ6´zúkàû.^¼hö>fì)J#rm9ıÕJİİİãúI¯³ÛÎawÖ›XÉ6´zmÀãÇÔ}LNF0ü]ê(]ŒÈ…[¦¦¦,\rìôô´W?éOl¼s¼›wK`#Ù†V/Üøz´?Ü\n%g|şO(]ŒÈU±‚n±Šü<¹2İwãlDŞöXÉ6¤‡/øÿÑ:4ëC‡l~ö\"¥‹á†^Ø\"&ƒÀÚkÄã6Vïc”.F222V¬Áú|¾é8™ÁöÊùâ»wïŞÎ3ØH·!Ãu]™Á&ŠÜÜ\\¿Õk°OŸ>ıÓæk°ï…•5Xmˆ5ØTTT4jõQ¿Úô(‚{r¦MhX	,Æ6ÄQ	èÒ¥K•V[\\\\\\o³ã`×±XÍmˆã`Ğ™3g>ÍÉÉyká™\\‹©©©ÇãÙ%–ÀFBÎäÒÛı’grÉ½ò8“Ë&òóóÿ²êZUñz~4%°‘âZ	èàÁƒI\'O\\²`;§g¯}\\M‹ÁÕ´Ì»š–ŞÇV¸š–Í¸\\®A³¯+ë½òŠú±µNËpø·ïšu=X=QZ6Î^ãu_sY§‘šuGƒÁÁÁZı3¦¸£ƒÀ¦ìÔcÆ„;\Z¬pGKOOOÓ3Ù…hß“kbb¢S¿myÄ=¹örO®à^Ñ¸\'WÈÌ•¥»JKKË’Fk&+3W‰«Ş \nãıß†ÀØ(Ïd3‘\rŞUVØìÑò–qÍU†ö5G“WW=›}qûöíW|ğ5wùòåk², ’ş],5c_ÓcÎH	­\'+\'#Èì4¸| Ë\0r†–œDpåÊ•‘‘ñ6äì±y§ìk	±&«_[\\.×t__Ÿo+Ç¹655Uë@÷Ê\"»“Ö,5k_3¾æè`Í5>Ÿü½ÚÌÌLoYYÙPggç#ı*:¼@Œ\\¸E®-àv»)))¹£_}ÇäÉ–WR§}‚I`	¬ÙûÚjh—¶V\'îk‰¸6+÷Ê[=Ÿú¡\\¡\'x¥¹˜„œï,§ä9ù¬K`Ù×\0K`X@`	,\0K`X@`	,\0K`X@`	,\0K`X@`	,\0K`X@`	,\0K`X@`	,\0K`X@`	,\0+µ´´6ûŒEØ%¶JÀ!ÚÛÛ§¼^/q³Á˜œœüIv˜­pˆÖÖÖ¯<ÏógÏùˆ\\ìf®W·ÛıH½l•€ƒèz9õÊÛSYdX>äß}˜¸\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˜ä?®#Š\r\0\0\0\0IEND®B`‚',1),('145006',2,'source',NULL,'{\"resourceId\":\"145005\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('145007',1,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\02\0\0\02\0\0\0?ˆ±\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\0 IDATxÚíÁ\0\0\0‚ ÿ¯nH@\0\0\0\0\0\0\0\0À£\'B\0ü¦•ş\0\0\0\0IEND®B`‚',NULL),('57502',8,'source',NULL,'{\"resourceId\":\"57501\",\"properties\":{\"process_id\":\"salary\",\"name\":\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\",\"documentation\":\"\",\"process_author\":\"bootdo\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/test\",\"executionlisteners\":\"{\\\"executionListeners\\\":\\\"[]\\\"}\",\"eventlisteners\":\"{\\\"eventListeners\\\":\\\"[]\\\"}\",\"signaldefinitions\":\"\\\"[]\\\"\",\"messagedefinitions\":\"\\\"[]\\\"\",\"messages\":[]},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"start\",\"properties\":{\"overrideid\":\"start\",\"name\":\"å¯åŠ¨å®¡æ‰¹\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"apply\",\"formkeydefinition\":\"/act/salary/form\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\"}],\"bounds\":{\"lowerRight\":{\"x\":60,\"y\":270},\"upperLeft\":{\"x\":30,\"y\":240}},\"dockers\":[]},{\"resourceId\":\"end\",\"properties\":{\"overrideid\":\"end\",\"name\":\"ç»“æŸå®¡æ‰¹\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1003,\"y\":384},\"upperLeft\":{\"x\":975,\"y\":356}},\"dockers\":[]},{\"resourceId\":\"modify\",\"properties\":{\"overrideid\":\"modify\",\"name\":\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${apply}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\"}],\"bounds\":{\"lowerRight\":{\"x\":311,\"y\":193},\"upperLeft\":{\"x\":209,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"audit\",\"properties\":{\"overrideid\":\"audit\",\"name\":\"è–ªé…¬ä¸»ç®¡åˆå®¡\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\"}],\"bounds\":{\"lowerRight\":{\"x\":201,\"y\":282},\"upperLeft\":{\"x\":105,\"y\":225}},\"dockers\":[]},{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\",\"properties\":{\"overrideid\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\"},{\"resourceId\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":280},\"upperLeft\":{\"x\":240,\"y\":240}},\"dockers\":[]},{\"resourceId\":\"audit2\",\"properties\":{\"overrideid\":\"audit2\",\"name\":\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\"}],\"bounds\":{\"lowerRight\":{\"x\":310,\"y\":410},\"upperLeft\":{\"x\":210,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\",\"properties\":{\"overrideid\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\"},{\"resourceId\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":390},\"upperLeft\":{\"x\":345,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\",\"properties\":{\"overrideid\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"}],\"bounds\":{\"lowerRight\":{\"x\":345.1328125,\"y\":370},\"upperLeft\":{\"x\":310.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"}},{\"resourceId\":\"audit3\",\"properties\":{\"overrideid\":\"audit3\",\"name\":\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":410},\"upperLeft\":{\"x\":420,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\",\"properties\":{\"overrideid\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\"},{\"resourceId\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":390},\"upperLeft\":{\"x\":555,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\",\"properties\":{\"overrideid\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"}],\"bounds\":{\"lowerRight\":{\"x\":555.1328125,\"y\":370},\"upperLeft\":{\"x\":520.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"}},{\"resourceId\":\"audit4\",\"properties\":{\"overrideid\":\"audit4\",\"name\":\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\"}],\"bounds\":{\"lowerRight\":{\"x\":730,\"y\":410},\"upperLeft\":{\"x\":630,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\",\"properties\":{\"overrideid\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\"},{\"resourceId\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\"}],\"bounds\":{\"lowerRight\":{\"x\":805,\"y\":390},\"upperLeft\":{\"x\":765,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"apply_end\",\"properties\":{\"overrideid\":\"apply_end\",\"name\":\"è–ªé…¬æ¡£çº§å…‘ç°\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\"}],\"bounds\":{\"lowerRight\":{\"x\":940,\"y\":410},\"upperLeft\":{\"x\":840,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\",\"properties\":{\"overrideid\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"}],\"bounds\":{\"lowerRight\":{\"x\":765.1328125,\"y\":370},\"upperLeft\":{\"x\":730.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"}},{\"resourceId\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\",\"properties\":{\"overrideid\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"}],\"bounds\":{\"lowerRight\":{\"x\":241.44715254815893,\"y\":258.8729578650751},\"upperLeft\":{\"x\":201.64659745184107,\"y\":256.4551671349249}},\"dockers\":[{\"x\":48,\"y\":28.5},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"}},{\"resourceId\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\",\"properties\":{\"overrideid\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\",\"name\":\"æ˜¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"apply_end\"}],\"bounds\":{\"lowerRight\":{\"x\":839.78125,\"y\":370},\"upperLeft\":{\"x\":804.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"apply_end\"}},{\"resourceId\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\",\"properties\":{\"overrideid\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\",\"name\":\"æ˜¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit4\"}],\"bounds\":{\"lowerRight\":{\"x\":629.78125,\"y\":370},\"upperLeft\":{\"x\":594.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit4\"}},{\"resourceId\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\",\"properties\":{\"overrideid\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\",\"name\":\"å¦\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":239.5},\"upperLeft\":{\"x\":260,\"y\":193.5}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\",\"properties\":{\"overrideid\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\"},{\"resourceId\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":85},\"upperLeft\":{\"x\":240,\"y\":45}},\"dockers\":[]},{\"resourceId\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\",\"properties\":{\"overrideid\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":134.3828125},\"upperLeft\":{\"x\":260,\"y\":84.5625}},\"dockers\":[{\"x\":51,\"y\":29},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"}},{\"resourceId\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\",\"properties\":{\"overrideid\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\",\"name\":\"æ˜¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit2\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":329.46875},\"upperLeft\":{\"x\":260,\"y\":279.90625}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit2\"}},{\"resourceId\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\",\"properties\":{\"overrideid\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\",\"name\":\"é‡æ–°ç”³è¯·\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit\"}],\"bounds\":{\"lowerRight\":{\"x\":239.7734375,\"y\":224.51953125},\"upperLeft\":{\"x\":153,\"y\":65}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":153,\"y\":65},{\"x\":48,\"y\":28.5}],\"target\":{\"resourceId\":\"audit\"}},{\"resourceId\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\",\"properties\":{\"overrideid\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\",\"name\":\"æ˜¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit3\"}],\"bounds\":{\"lowerRight\":{\"x\":419.78125,\"y\":370},\"upperLeft\":{\"x\":384.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit3\"}},{\"resourceId\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\",\"properties\":{\"overrideid\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\",\"name\":\"å¦\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":365,\"y\":349.6875},\"upperLeft\":{\"x\":311.859375,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":365,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\",\"properties\":{\"overrideid\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\",\"name\":\"å¦\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":575,\"y\":349.6875},\"upperLeft\":{\"x\":311.44921875,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":575,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\",\"properties\":{\"overrideid\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\",\"name\":\"å¦\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":785,\"y\":349.6875},\"upperLeft\":{\"x\":311.244140625,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":785,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\",\"properties\":{\"overrideid\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":974.078125,\"y\":370},\"upperLeft\":{\"x\":940.5,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\",\"properties\":{\"overrideid\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\",\"name\":\"é”€æ¯\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":989,\"y\":355.89453125},\"upperLeft\":{\"x\":280.2216796875,\"y\":65}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":989,\"y\":65},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\",\"properties\":{\"overrideid\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit\"}],\"bounds\":{\"lowerRight\":{\"x\":104.83832369973481,\"y\":256},\"upperLeft\":{\"x\":60.49976831931648,\"y\":255.3340467200345}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":91.4000015258789,\"y\":256},{\"x\":48,\"y\":28.5}],\"target\":{\"resourceId\":\"audit\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('62501',3,'source-extra',NULL,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0Ì\0\0\0™_Ğ³\0\0\0 cHRM\0\0z&\0\0€„\0\0ú\0\0\0€è\0\0u0\0\0ê`\0\0:˜\0\0pœºQ<\0\0\0gAMA\0\0±|ûQ“\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0 \0IDATxÚìİ	xTÕıÿñ3“… û¾ˆQYT\\Ëßb‹¢¨EE ŠVjkµˆ±ŠşXAêA…„Ek•*²*P!D ABB6²ÌıŸïÍ½ñfHB¶Éú~=ÏáÎrgææÌœó™sÎU\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨!ÆŒÓŒZ\0\0\0\0PYÜT\01eÊ”QYYYÉááá£©\r\0\0\0\0•Á*\0ğôÓO‡>|ø½ë¯¿ŞıÇÁƒÇ}ıõ×ÑÔ\0\0\0€Š t@}¨Ët«Ë]Ò½î—Q@Ctù±ˆÇér.‰Å<÷Õº\\¡ËÅÜßÎÚf{İ>S—5U]“\'O\Z¿xÂ„	~7Şx£êÚµ«kİºu·0à›6mÚ]E‡ñ[]ÒtÉòº­—.û‹Ø¿ƒ.}u‰sÜÖJ—«~Óøˆ\0\0\0„@U‘ àB]:ë2^—«t9¢Ë\n]RtÉó\n$$txP—/t¡Ënëq­u	³ö/.Tè­K°Ê3Š\"ë•º¼¯ËÿÓåb]~£Ëp]~Ñ¥§.÷êò¹¯+EF8$$$DJàpé¥—š·µmÛVuëÖÍ½~ıúÛ®»îºª\næéò©.™ºÜj½\'=¬ßQ\'¬û?²ö¦Kw]âu¹D—	ÖcWYûÎÕå>ò\0\0\0\0¡P¤c..]tédun©üoÌïÖåJ]6Zû_§Ë(]>Óe´@ĞeŒ.ÓuY_Dà°È\n$<¸Üz@ëúkÖsÙ£)<º4Ôe›2ÈsÉ·ùƒtyÑ\n6ZûùŒ¬İ·püøñn;p°µiÓÆ6lØpÛoûÛİ[¶lùÑ‡‡ÒDå*IĞå>]\"U~à²Áºÿ\Z]^Vù£Ä\rº¼§ËÏV½İ¬Ë\'ºü^å òC\0\0\0\0„€ÏÅYş•?]¢…ÕY• @F,|e]¶IÀğG]>TùÃû§[¿½„Îì0+0çm¤K’µ¯\\¿É\nœöªüéşÖóvµö“¢.©Ê‡S$pˆ]ğğÃ»/¹ä’\"÷‘İ»wwùå—wôéÓg×Î;÷úèpdT‡ŒdØªË×*DÊ]ÚX¿£6©üÑ#û¬ı%d”DB£ş*ÔÃÿT~È#Ïq.kUş4˜,>ş\0\0\0\0¡àk×ë2TåtõZªü)xZ¡ Ãû“Uşè!½òÖÖõï¬ïCV7ÓzÜ_Uş\ZEtäd-ùæ^¦VÈt\0ù†?ÅºOÂŠŸ¬ËÒe³ãù+3p!CŸ>}JÜWF<tïŞİï›o¾¹£oß¾;vîÜ¹¿’ÇmÕ÷¥Ö{r³$µê%Íº}¸U_Bz–Êv$¬Kˆ.¯ëb¨üòËô‹“|ô\0\0€êÃ)3Q_H°àoËş^S²/S%ŞVù£djÄ*ø¾Œv8duhQùëØ~±ö‘²E—ë	ıäùUş”Šx+Œèjİ·ÆÑ©êõü•bâÄ‰·<xĞœRq¶ÀÁÖ«W/õØcz<aaa7Vò!«Ë]ÚZ¡ÂÿY·7¶‚„ërº×ï­.rÂªÏ»­\0BB¢ó­÷\n\0\0\0\0¡P%¶Y!€ßY—wªüéN7XW	¤“nu}E¹\\ë(2½ ¹²_DF8¤¤¤,w.\ZYZ<L<9ÀßßÅˆ#n©ÄÃ:¥ò§Wt²êú)ëö5ê×ĞÆûŒoXAƒ™>!Ófd“Öşuùw\0\0\0€Ğ¨*ÒAm­~ı&üJë²,0yØkßuVÇ?Ö*¯¨ü‘±%<{ëù¤\\n½†}½u	íONûb]Î©ì~Ê”)£bccß-Oàà}ôÑ ÀÀÀe•<Èº2ªDF˜¬ÖåŸÖí78êï¯Çt´¶2BF@|j]oaÕ½Œj9ÂG\0\0\0 t\0ª‚L¡hk…	{¬á€uY¾E¿Ûk9%æ6ëòV§X{ü¤„×¸K?½âú\"ö—õdZAŒu|!â_ÙÃáÃ‡Ê\Zå\rl2%còäÉ•<8õµ.—4ÒAŞYë!×ÚÊ©5%¨‘…;å¬/ğ‘\0\0\0€ª\"Óe*=™çÜ*‡¬¬éÿ­µo UşëhêÒYåOÉ­Šx’¾Y/êÔ—èaÛ	G[Ê±ÊúÁeJ…8”v\r‡³±¦Z,­Ä5¤Î_R¿.èéÔÈqYyÍ‰Öu	ˆö[—u0$’¨{\0\0\0 úùS¨ãZXB®ã¶ÆV\'u°£Sû;•¿°ã)«Ó*ë,tUù§µ¼J—Ç_|–×t«³zò~†×mrŠÈIªèP£ÌìE#\'L˜P8¤¤¤¨xàŒ}çÎ«Zµúõe322Ô½÷Ş{Æ~óçÏWÍ›77ƒ‡Ç<xúôé„……\rŒŒ\\]ÁÃ•PhƒU\'Çû%Ó\\^uÔ¿Ô«LA‘5æXïã@]šªü3Š	mæë\"?(Ó,\0\0\0€jä¢\n€³Ş#­0¢8g»ß›¿*ŠT˜Œp°‡3Öpøê«¯ÔÂ…Í`ÁüİnuÁÈ4Œ‚}æÌ™£¶oß®rrrÌëçœsºùæ›Íâ´sçN5cÆŒôÜÜÜĞ%K–|ìÃ:¯Œ}\0\0\0T1?ª\0(‘QÄmygyL^_£R;Íááá£ccc#Š[4²K—.jË–-*99ÿ†a¨´´4Õ¡CÕ¾}{µwï^µbÅ\nuúôió~sÄ¸qãÌ€Â©mÛ¶ê¼óÎSß~ûí^xá®={öìóQWÆ¾\0\0\0\0\0”—8,5.¹ä’b÷»ğÂÕ×_]0’!77W}ÿı÷êw¿ûš6mšJMM-Ø·qãÆJ?ŸjÑ¢E‘ÏÕ¦M?;x¸øâ‹·ÇÄÄüw\0\0\0€ t\0êˆ§Ÿ~:,..®T‹FJ­bccÍÀAx<­ÍË\"$$D]sÍ5êºë®+ñù$xèŞ½{Ş·ß~{Û…^¸§’F<\0\0\0\0¨å€:`òäÉCãããË”Š’F88É:_|ñ…ÊÌÌ4¯KĞ #òò~Ò¨Q#5iÒ$pÖçkÛ¶m@·nİò6mÚ$S-v<\0\0\0\0 t\0j9á`E­áPYŸ¡{÷îæúö4§fÍš™g°5 J«]»vçw^Î·ß~;”à\0\0\0\0g¯€O…††vÕ›1Ô„o´oß>%99yÖøñãİe	œ^~ùeµyóæ‚)B	Y÷á©§*×sFGG\'MŸ>]Îâ±Ê0Öx\0\0\0@}[pŞ{øØ]¦R\r¾qôèQuÓM7©òbÔ¨Qê»ï¾+t›œÑâöÛo/÷söíÛ·y‡R><’w	\0\0\00=ShBT¥pª ruîÜùÔ†\r¦÷éÓç¬‹GgñâÅÊår™AƒMF:¬ZµÊíP;vì8väÈ‘Fúy1Ò\0\0\0õX½ÿ–ĞU%<**êª¡ò=ùä“?Ï=;ò¡‡*ó‹½{÷ª]»všZ!d1ÉC‡©­[·ª~ıú•é9%p˜1cF°~Î°%K–|Ì;\0\0€ú*44T6õ:xpó1\0j·iÓ¦-=çœs†Î›7/oçÎ¥~œ¯¼òŠJKK+¸MF<ØN<©Şyç•‘‘QêçÜºu«8Œ$p\0\0\0\0@è\0ÔsæÌYÙ¬Y³;õ6oûöí¥zÌ‡~X(PÓbvîÜ¹Ğé1å¬K—.-ÕóíÛ·/~öìÙ\0\0\0\0l„@!ÁC£F†Í;7çlÁCBB‚Z½zu¡Ğ!88Ø<[EHHHÁm§NR›6mR(ñùdJExxxSÃ0Æ8\0\0\0\0°:\0uÈüùóWdff~ùå—³K\n^{í5•]p½aÃ†jìØ±fà0~üxTpŸ~>s™Q{\rÃ0FFFF®ä]\0\0\0\0`#t\0ê˜¥K—®ÍÉÉ2oŞ¼¬¢‚‡7ªÃ‡«ÜÜÜ‚Ûºté¢®¼òJórÏ=UïŞ½Í3X	\'ÒÓÓÕš5kÎx.ç\Z\0\0\0\0¼:\0uPddäêÓ§Oß>gÎœ,çâ’)))2\ZÂœî¿ÿşB×ÇWèŒIIIêİwß5·6áğÒK/ë‹#˜R\0\0\0 (œ2¨£$x>|ø­³fÍú÷Ä‰ƒätšÍš5“ÛÏúX™nQÒ~2ÂÁäu¨m\0\0\0\0Ea¤P‡ÉT‹Ó§Oß*#¶mÛ–WÏ)ƒ}–\n\0\0\0\0%!t\0ê8Gğpº¢Áƒ=¥\"//ï¦T\0\0\0\08B à!//o¨ÑÑÑå\nìE#k8\0\0\0\0(%B ©<Ìœ9S¦Zd—å±ÎE#™R\0\0\0 ´€zDƒœœœÛfÏSÚàAÇi1	\0\0\0\0”\Z¡PÏÈT	^zé¥ì­[·¦—´ï¾}ûâgÎœ¢/fJ\0\0\0€²\"t\0ê!	Ã6{öl×öíÛS‹ÚGÖpÒûÉ‡•Ô\Z\0\0\0€²\"t\0ê)™*‘››;dÖ¬Y®-[¶\nœg© p\0\0\0\0P^„@=&#rssï˜3gkÕªU©Ï=÷œúøã“ì5˜R\0\0\0 \"€zÎ¢¢¢\ZïÙ³G-Z´¨\0\0\0€Ê@è\0@5lØp£ã÷;88x-µ\0\0\0 ¢\0¨¬¬¬«œ×OŸ>=€Z\0\0\0PQ„\0”Ëåú“óºa÷R+\0\0\0\0*ŠĞ€òx<7yİ4`Ø°a©\0\0\0\0Aè\0Ôsaaa7º\\®V›ruiéççw#µ\0\0\0 \"€zÎãñòºÉem‡P;\0\0\0\0*‚Ğ¨Çà¯7÷yİìgmo3fLµ\0\0\0 ¼€z¬]»vW¹\\®3Ön0#[o\ZŸ>}š)\0\0\0\0ÊĞ¨ÇÃ¸¿¨Û].—Ÿu?S,\0\0\0\0”¡POÉÔ\nÃ0ŠÉ`‡2Å¢µ\0\0\0 <€zªuëÖ¼ÎZá-Sßß,33³?µ\0\0\0 <€úÚøİî³M0Ïbár¹FS[\0\0\0\0ÊÕï \n€zë³Üo¹Â0ŒÖY.\0\0\0\0 L€zhøğáõ¦Iiö•)mÚ´¹“Z\0\0\0PV„@=är¹ú•qÿ¨5\0\0\0\0eÅi Z²dÉ‹zó¢ó¶ĞĞĞgôfª.áQQQÏPK\0\0\0\0*Š‘\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€OøS@å3#èàÁƒãÓÒÒFeddôHOOòx<5ú˜õ±ª}ûö©óÏ?ê½÷Ş;µ&«Ëå2\Z4hp\"00psNNÎÌşıû¯çS\0\0\0Ô<„@%;xğà_¶nİ:+++«aÛ¶m•”åv×üEƒ®uìñx\\iii-SSS\'$$üê«¯~ÈÌÌ5hĞ >\0\0\0@ÍÁô\n ÅÅÅ­<tèĞ«-Z´hxùå—«Î;«¦M›ÖŠÀ¡VıâÒõÙ¤IÕ±cGÕ¯_¿ÀN:õ‘QëÖ­Bí\0\0\0\05èowª\0¨8è2ä¢‹.R:t)\0TJiß¾½êÓ§O°Ûí~oíÚµ·P#\0\0\0@Í@è\0T™RqàÀ!=zô0¿÷v:í˜:ıÚ·şYµwİ3*nû;*+õW‰\Z5j¤z÷îâr¹Şûì³Ï.¦F\0\0\0€êGè\0T,\Z™˜˜8K¦R8ü¼}JKÜ«<yÙÊğäªŒ¤ŸTÜ¶·	*™]»võøùùÍ¥6\0\0\0€êGè\0Tœ¥B”!şEI:ôµÊÍN?ãv	 n +YÇ›ûûûÿæóÏ?¿ŠÚ\0\0\0\0ª¡PArZL9CEqk8d–0šAFA òµnİ:Ao†R\0\0\0@õ\"t\0*(##£‡œ¡¢8F^Nñ6<T ´lÙ²ƒŞ &\0\0\0€êåO\0“BEÔ úıh§7­¨	\0\0\0 z1Ò¨ Ç£ÜnšRúÅ–ÿ~ª\0\0\0Õı·9U\0øV@ğ9ÅŞçß€\0\0\0\0ê.BÀÇšw¾Fù6:ãv¿€`Õ¼K*\0\0\0@Eè\0øXãV=U£–=Š¼=¤õET\0\0\0€:‹Ğ¨y9™gÜ–{ú\0\0\0 N#t\0|(;ı¸ŠÛö¶J;şÃ÷¥ŸØ¯â¶¾iî\0\0\0\0u¡à#\'nWqÛŞRÉ‹İ\'#åŠİüªJûF†‡J\0\0\0P§pJ9 ’ÉÈ…cû>1G2”†\'/ÛÜÿÔñTëó« vT\"\0\0\0€:‘@%“‘¥\rœdDÄ¡-¯S\0\0\0\0êB ’ÉÈ…ò2<¹T \0\0\0€:ƒé@%»`àsT\0\0\0\0(F:\0\0\0\0\0\0!t\0\0\0\0\0\0>Aè\0\0Ã‡344ô\'j\0\0\0¨8BÀG¾úê+µnİºBå7ŞP\'Nœ¨´×xæ™g\n.ÏŸ?_åæ}!Êììluøğauüøñ‚Û>ùäóvÛk¯½¦öï/|÷Ş{O<x°ÈçLNNV}ôQ©[öŸ7o^Áõ­[·ªeË–•ég—cLKK«p0 ±4$éb¸İîûôÍçò	\0\0\0*…$Y¸p¡zûí·İ¶hÑ\"uÿı÷ºM:Î§OŸ.öy^~ùe¦zöìi^—ğâ¼óÎ3/ÿøã*..Î¼,Û£Gª„„µjÕ*õüóÏ«Ÿ~úIíÙ³GEGG«-Z¨îİ»«M›6©K/½T<yRy<uË-·¨½{÷ªÁƒ¼æ?ü F\Ze^^½zµºñÆÕ†\rÔ°aÃÌ×	/ô³EEE©N:©ŒŒõŸÿüÇ|üW\\aŞ7}út3P×·I@Ñ£G‚ërÿ¤I“\nêCJÛ¶mÍëÎF³]»vªM›6jÍš5ê/ùK¹ƒı<á†aÈ›Ñ˜O+\0\0\0@è\0Ô:ÎÑB:ùŞRRR”¿¿¿jÜ8¿ï»bÅ\n¨n¾ùfóúã?nŞoûıïoneÔÄ AƒTçÎÍëøÃÌËRì»„\Z5R_|ñ…\nHxpñÅ«ï¿ÿŞ¼_n=z´\n.òø%<Ò°aCóºÛíVK—.US§N-ØGFW8p@=ğÀjûöíf0!Aƒ¼–Œ–ĞüBƒØ¸q£š6mšY¿üò‹YDÈ±Ï=Ûf†jî›““SP7rÜ²ïæÍ›ÕøñãOÂ–öíÛŸõı[¨_SÒ•–†ağ\0\0\0€ÚI¾É—Îµ“„\0Ş:vìXèzPPjĞ AAGÛÛ—_~©233ÍNú_ÿúWõè£š#N:eŞcwß}·¹¿tÎ%àbåÊ•êĞ¡Cª[·n…‚ÄÄÄ‚Î»ŒŠŸ}ö™jÚ´©Ùù_°`ùxEqùå—B¦]<ñÄæ”‰ç{N½ùæ›êØ±cæ}2âÉ\'Ÿ,tüDÈ1~÷İwæóÉk¼şúëæô…!áÅm·İV°¿ 	G¤~$˜‘ã’QêÖ[oU#FŒ(Îˆûî»¯MZZÚ}q´.%hp¹\\|8\0\0\0B ö’x‡ÎéĞ¯_?uÇw¨?ü°ÜÏ}õÕW«9sæ¨åË—›#$p‘²†„LÅøãÿXh9V­Z™ÛªO?ıT­]»Vååå™Ó!¤Ão¯ï £¤Èóşùæ”éØ_uÕUæÔ	$¤cÿç?ÿÙd”Â¿ÿıoÕ¤IsÚ‡„2ªA‚™†qäÈ3 0ãé§Ÿ6_C®‡††šÏsÎ9ç˜áL§iñññªoß¾f\"£*Äîİ»B	[öíÛ§š5kf¤òóŒ9²ĞÏ,õ+SL´„òÖ³>ÆØ\Zü“Ÿ+‹–”ŸËåŠ6#…š\0*$\"***–j\0@è\0T1Yğ›ßüFõïßß¤SoOÎ{yIH AVV–Ùy—ÿüç?Õ!C”|‹o‡ò\Z²„Œ\n!!!æVÖà@¶rŸ\\–ÇÊ›,2)¡,î(|û¸íN¾øàƒÌmëÖ­ÍğC®ËÈ\n¹.„2*añâÅæû±²&Ãí·ßnÂÏÏÏ+d”„L#™9s¦JOO7×“0Eêğ…^0Gt{ÔƒL+‘c–0$55õŒz’ ¤t©Á±.´2 bôïÌßQ@¥x†*\0@è\0T£Ÿş¹ Ó_Q²¶‚,ø(£zè!sí }YÌQ¦sÌ˜1CM<Ù\\û@:é2bìØ±æYA¦^È	{™Ê°~ıú‚×DÈÚŞaEÂ‰€€\0Õ»wo3`‘Q2âã?VúÓŸÌõ&L˜`îk/i‡2ÚBÖ¨‘2Œ3ÆNœ#$˜ğÆ›<¿Ô«,ŠéM¦[X#*âP\räØbi]@¹ØaÃ—ºl :€r™J\0 t\0ª‘t¦mrÖéPW9m¥,î(‹7ÊdqEpå•Wšxå`/6)dê…Œ<\"g~…e4Á5×\\ciÂIFR´lÙÒœ¾ $,©\"$EÂqãÆ™AˆL±E#_}õUs\Z‡œ†S‚yâHX!¡…ŒÜ\r/¾ø¢¹„ŒŞ(nM›Œ&yå•W\n-ji“),òs,Y²¤í©S§æ¸İîë\rÃhQ–zŠŠêZÓ>W¡¡¡ÏXèÉpÖghi@…ÚÑÚPîvDğ\0€Ğ¨N²8¤|«/Ó¤C-[é\\K§üÁ¬ĞsËÈ	dÄ‚ŒV¸öÚkÕ7ß|cN5(Š\röôY;AF\0ÈBŞë ™ª 2ÊóÙ¯e/HéYpÿ;ÌË2¢ANÏ)k9ÈÏ.k6Èˆ\n{‘ÊâÈ:2BãÙgŸ5ÃyN}!¯á;dÊ‡L‘Å8etC¯^½Ì‘Î…&½½õÖ[²¢e˜\\–Ód¶iÓf±¾x­ËåjÊ§\0\0\0 t\0j%éäËÂˆ=ö˜ú¿ÿû?sqF™\n Ód-™Š ¬õ %:IÇİy\nMYŒQÖLéòXİ Á…ŒBrêLéØÛS¼Éãíé€È(çÙ\'„½„³/£dİ™¦áÍ>õ§L‹˜2eŠ¹öÂ]wİeœ³iÈY)d‚œYâÎ;ïTsçÎ=ã,2eBê@‡®]»š§É”ŸEÖ›X¶l™¹È¤8yò¤º÷Ş{Í)2åCÈÏóÓO?™§×”o[dİïÓrzÛ°aCšŞ¬²©÷ŠËå\n5£¹¾Ê)-\0\0\0\0B æ“º¬ã A€œMÂ¤£/gUÛ¶oßnvºå›ü+®¸¢ĞTçÔ›=Ú@ÂY\'AF\"Èt	!v»3.ì³>Ød„=ÒA¦$ÈY\'dJ„˜5k–¹õÊ ûÉ´\rQ Ó3¼íÚµËÜJ˜\"§Ä”Ñ²À¥,)?›	$|5(d\n†M^SÂ		Bä4 rÜrêMï×“ç·CFQÈh	9ìŸé‘G1GHH(SÒ¨ozÿñz3Ş\n ¦†ñWF@\0\0\0\0„@&!BqSÄÃ?\\èúÙÖ.p²;ä2¥BŠRÈÈ›¬©à$£-\n\Z¼ŞoôèÑÁ„ı8Y|ÒIFg”t\\r¦	›BF]ÈçY.„Ş‹=ÚSLdíy\\Iœu)û{ŸTê[ÖÍ¨ˆ¨¨¨\'%ßàÓ\0\0\0T.7U\0Tr£rWm³rE]÷fŸµ¢$e	BÊó³ÛûÙ§ô,-çH	\0\0\0\0µ D\0\0\0\0\0\0_ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡PÑFäv‡Š¨AôûqHor©	\0\0\0 šûKTP1AAA¿œ:uŠŠ¨A’““cô&šš\0\0\0\0ª¡PAO<IEÔ 			©z³š\0\0\0\0ª¡PAYYYÓãããsÃ 2j†Ø¤¤¤>zûU\0\0\0T/B ‚®½öíâ|\0\0 \0IDATÚÍ†aì:zô(•QÄÄÄ|®ß£×_ı&j\0\0\0¨^„@%ÈÊÊ\Z›‘ššJeT£”””UIII·z<IÔ\0\0\0Pı€J0hĞ uGwÈ={N<T	vïŞİËårıY¿1Ô\0\0\0Pı€J2pàÀµ¹¹¹wîÜ¹35...‰5ªLlLLÌ›»víºR_~X¿S%\0\0\0@Í@è\0T\"	òòò®Œİúí·ßß¿ÿäääÇSãıÀêÅ_T?ıôS?V]Ÿ‡Nœ8ñŸ={öD~ıõ×IIIİôm×8\0\0\0\05‹?U\0T.™j!›5kÖôªË\0}½™.A5ù¸?üğC•œœ¬æÌ™£†\rVÓ«¹ƒ.ÇuùA—¹,\Z	\0\0\0ÔL„€ÜpÃ\rÑz]uÌ˜1AYYY™rYÖ¤X´hQpDDDï\"\0\0\0€Š`z\09ûÆUÎë§OŸ@­\0\0\0\0¨(B\0b¬óŠa÷R%\0\0\0\0*ŠĞ€¸Éëú€aÃ†5¦Z\0\0\0\0T¡PÏ………İ¨7-7åÉu??¿©\0\0\0\0Aè\0Ôs†axrpYÛ!Ô\0\0\0€Š t\0ê±Èlî-æ÷ÂmrVj	\0\0\0@y:\0õX»víä¬¼o7#[o\ZŸ>}š)\0\0\0\0ÊĞ¨ßşRä/·[F@HøÀ\0\0\0\0åFè\0ÔS2µÂãñÜPÔ}†a¸­­L±hFm\0\0\0(B jİºõ\0—ËÕª„]²ôıÍ233ûS[\0\0\0\0ÊƒĞ¨§üüün?Û.òËå\ZMm\0\0\0(B òx<wŸe—\0ùÇ0ŒÖY.\0\0\0\0 L€zhøğá].WHiö•)mÚ´¹“Z\0\0\0PV„@=är¹ú•qÿ¨5\0\0\0\0eÅiTš#F<¡;§/s÷ÔĞĞĞ©Î¢¢¢\\ÔZõX²dÉ‹zó¢ó6ış<#ï“.áú½y†Z\0\0\0PQŒt@å}˜Üîhj\0\0\0\0PĞO¤\nPY\"##W†qª”»¦Æ\0\0\0\0 n#t@e[~–ûóäÃ0VSU\0\0\0\0P·: R†±ø,»äÈ?.—kµ\0\0\0\0u¡*UÃ†\r7êMr	»é’˜°‘Ú\0\0\0€ºĞ•*\"\"\"Ëår}RÌİùÇ0Œ•6lÈ¥¶\0\0\0\0 n#t@¥3ã­bî2×sp»İPK\0\0\0\0P÷: ÒÉÔ	Ã02Š¸+@—Ãñññk©%\0\0\0\0¨ûPédê„ÛíğºÙZ±š©\0\0\0\0P?:À\'<Ï§Îë†ax¬‹_P;\0\0\0\0P?:À\';¶Zoíë.—Ë_®{<©Ÿè­ËÅërJÒ§¨\0\0\0\0Õ‰Ğ>!S(\\.×g^7¯^¶lY\Zµãß;.·Ğ%K—çuyQ—Ë­r¥.¿¥ª\0\0\0\0TBøŒ÷Y,\\.g­ğY\'Ã^¼S‚†{­ËÛtùÅ*\ru9LU\0\0\0¨*şT|%((hSVVVÁõ\r\Zl VªÄÇe	Y—ı—\0\0\0Àçé\0Ÿ‰ˆˆÈ2c¯\\v¹\\ôõjÅ§nÑåïºdêÒW—Ë¨\0\0\0\0Õ‰‘µ”îÌ<xp|ZZÚ¨ŒŒŒéééA§Ægbb¢Ú¼y³ºì²ËÎ;v¬QÓÏår\r\Z48¸9\'\'gfÿşı××âEg]®Öe±ÊÕDK\0\0\0Pj¡ƒşeëÖ­³²²²\Z¶mÛVI			QnwÍ¸rÇwÔØºôx<®´´´–©©©ƒ~õÕW?dff\Z4hPL-ühüK—wu™¯òG=ˆsi1\0\0\0\0ªÓ+j™¸¸¸•‡zµE‹\r/¿ürÕ¹sgÕ´iÓ\Z8Ôø ë­I“&ªcÇª_¿~:uê#£Ö­[7¤–şH»tyD—©Öõ)ºüh•OtÙÊ»\0\0\0 ª0Ò¡‘ÀA—!]t‘ÙQFåkß¾½„8Á»vízoíÚµw\r8ğãZtøvò´O—x•¶Š?«ü3[xï\0\0\0\0UÖIA\r\'S*80¤GE§Ó©ÃÑï©}ëŸU{×=£â¶¿£²RPqåĞ¨Q#Õ»wï—ËõŞgŸ}vq-:ôÆËoè2F„‡w\0\0\0@U!t¨dÑÈÄÄÄY2•¢¸ÀáçíTZâ^åÉËV†\'We$ı¤â¶½MğPN<tíÚÕãçç7·v´×õñN\0\0\0¨N„µ€œ¥B”¡ÿEI:ôµÊÍN?ãv	 n Ë©cÇÍıııóùçŸ_Em\0\0\0\0@Ù:ÔrZL9C…Ëå*òşÌF3È(”_ëÖ­ôf(5\0\0\0\0eGèPdddô3TÇÈË)şÁSø+¢eË–ôf\05\0\0\0\0eÇÙ+jôôô *¢\Zèzo§7­¨	\0\0\0\0(;F:ÔG¹İ¼UÕÒ@òëp\0\0\0\0ÊÓ§¢\nj¿€àsŠ½Ï¿#$\0\0\0\0\0ÕƒĞ¡hŞù\ZåØèŒÛı‚Uó.ı© \0\0\0\0@µ t¨\Z·ê©\ZµìQäí!­/¢‚\0\0\0\0\0Õ‚Ğ¡ÈËÉ<ã¶ÜÓ§¨\0\0\0\0@µ©Ñä†´{÷îÑ;vì¸+>>¾ïÑ£G¦¦¦úgee)#$$$§yóæGš4iòŞıŸûÛßöÖ·70;ı¸Jøñ#•‘|ğŒûÒOìWq[ßTm{Ş¦q”¬}ûö)º©Î;“V\0\0\0¨52t°áÃ?|ã¹ç;qâ„Ï=Õ€T§NTóæÍUPPÊÊÊr:u*ğçŸîÓmûöíwMš4).==ı¹7Şxã­úğæ<º]ÿßg*7;½Ø}2R©ØÍ¯ªVİªf®R.ƒ[p¦§Ÿ~:L·¥Y7İt“Ú°aÃô\'Ÿ|òÄ´iÓ\"¨\0\0\0\0u*tØ´iÓØçŸş_\'Ol\Z\Zªúôé£üüüÎØO‚)­ZµR—^z©ºç{\\;wîìõÚ¸qãMJJºuÙ²eÿ«‹ošŒn8¶ïs$Cixò²ÍıOÿAµ>°\n\niÇ\'&O<4..î½	&¸¥-é6ç7oŞ[“&MÊ={öbj\0\0\0@yÕ˜¯½\rÃğ_µjÕºˆˆˆ·u§§Á/¼`†	EÅ‘€B?ÎïöÛo¿ $$d×ı÷ß_]|ÓdäBi\'™‚qhËë|êQ@F8$&&.0a‚Ÿ´7»=üğÃ~ÉÉÉïNš4é.j	\0\0\0@yÕˆĞA‡/¿üò›µk×^÷È#¨[n¹¥Laƒ·AƒIg*ØívÏ½ï¾û¬košŒ\\(w]{rùÔÃ>úçŸ~üøñn;p°õêÕKMœ8Ñ|ğÁÛ©-\0\0\0\0åQ#¦W|ôÑGkÖ®]{ù”)SÌé•¡K—.êÙgŸ\rşÇ?şñbXXØÉÈÈÈ÷ëÊ›vÁÀçøä¢B$pˆ]ğğÃ»edCQäöGyÄoÖ¬YKî¹çaï¾ûî*j\0\0\0@YTûHYÃáÓO?½nÂ„	•8Øäù|òÉÆóÂÂÂ.àíÌÀaäÙ›ŒxxôÑGôÅ¥£G¾™Ú\0\0\0PÕ\Z:ÈY*Ö¬YóêÍ7ß¬~ó›ßøä5dÄÃˆ#\Z¸İîwx»QßMœ8ñ¶ƒ.”)gl<<öØcgEXXØÔ\"\0\0\0€ÒªÖĞaåÊ•oËi/e\r_\Z<xppÓ¦M»éÓ¨úúF?óÌ3—çÏŸ¯rsÏ¾¶Cvv¶:|ø°:~üxÁmŸ|ò‰y»·¸¸8•pÖçüè£ÔW_}Uè¶éÓ§+İ¡-ry½­[·–ùç}ë­·Š<ÎúLF8¤¤¤,w.\ZYZ<L<9ÀßßÅˆ#n¡6\0\0\0ÔèĞAF9ÄÄÄ—ÓbøüõÆwÛí~°>½¹ëÖ­3Ã\0)?şøcÁe)GU›7oVO=õ”¹ïO?ıdÏ>û¬J¬^½ZM›6Mmß¾İ¼¼páBuâÄ	µwï^xÆkuîÜY¾EWkÖ¬)ñ˜æÍ›§’’’Ìç|î¹çÌc8xğ .ÈmöñØn¼ñÆ‚ÀD‚	œE¹]Â§F\ZVxïSŸL™2eTllì»å	œÁÃ£>\Z¤ßÿe\0\0\0\0jtè°{÷îÑ¿üò‹i‡xWTïŞ½4hĞ-44´kUÿ¬ú5ÿ¡ËÃ†\rk\\•¯ûûßÿŞ¤3/£Iä²”?üáæöŠ+®0ÆÜ·{÷îæu	\Z6lhvöï»ï>¤š6mj†-Z´PÁÁÁÅ¾^xx¸Š.¸¾iÓ¦B£–-[f†§N2_oÈ!fpğê«¯šÏùå—«çŸŞÜWFW,Z´È1ä8î½÷^ó¹$d¸õÖ[ÕÆÍòÏşÓ|¾¨¨¨‚àBŠşl©”””‚ëÿûßÍ}êkàpøğá…²†Cy›´×É“\'<\0\0\0\0(•j;{Å;î’LENYV½zõJøî»ïîÔgVñûO³²ıı=¡¡¡;õÅtÙ ;ô›\"\"\"²|õ¢_~ù¥ÊÌÌ4G0üõ¯•o©Í`@:ér[LLŒêÔ©“ºûî»ÍıÇo\ZĞÇ)S_Ô¡C‡T·nİ\nO¦@$&&\näºì/dÔ‚\\–N¾ÈÊÊÿÑÚ¶mknÛ´i£Ú·oo†²ß?ü ÜîüÜK¡Aƒêã?6O™*‹€9Ò¼OF\\<ğÀªcÇf‰ŒŒ4ñÎ;ï¨sÎ9Ç¼<xğà‚c“Q\rò³É·ó¢G…~–úÂZ4rai,C;2ƒ‡éÓ§/\r»C¿«ùU\n\0\0\0 F…ñññ}P¥¯yå•W6ûî»ï~W\r¡ƒÉ0éa_b•©ºS\Z\Zú¾¼Zw¾×=z4fÃ†\r¹•õzW_}µš3gZ¾|¹š:uª8ÈÔ-ğòË/«?şñ…öïĞ¡ƒÙÙ—íÀÕ§Ÿ~ªÖ®]«òòòTFF†zıõ×­ïpÕUWz¼„È(‰¢È(	5$¼°¡qãü2\rD_¼ñÆæqË¨\n!ÁÄ‘#GÌÑ²öƒ#2uÂÛc=f†ö7ùò¸–-[šÕn•ššªüñ\ZİõgÁĞ™2?((heDDDJEÏ^4rÂ„	ƒŒş\0ÇÛÜ¹s=FŞ]âM¦Ş4oŞÜt}ë÷äƒ°°°¡\0\0\0\0ŠRmÓ+t»¡œY¢*{î¹\rõ¦o\rª™«ğ]fèøvíÚÑ¸Hİù3räÈybé4Êˆm°bÅ\n3©²Îak\"ÈH{D‚		1·§OŸ6§JÈVF%Èe}|f§µ,Ç`“i2rAF(È´‰óÎ;¯ HÈ±xñbÕ¯_?s†8$\'\'«˜Ç¹~ız3XØµk—9\r£(².…R.¾øb38±/ËkÔıtyG¿\'Çõçà]ú•çIŠ[4²Y³ffè Sh\n~	¸İêµ×^+ôx	œk­Èh’Q£F™ƒÍ:«ECıøåLµ\0\0\0\0P”jéššê/ ª¤;Á­t‡;WwäÑWe±‚Ş¶îôÖ\'s”Ş\'Ëår,F /§EFF&úúøôë¶Ö›P)2º@g¾ü½,úXVÒ©”é2šá¡‡2G	HçRFÈÚ²ÂŒ3d˜¼$È™N1vìX³Ó¿téRsz‚tğíêm·İfvş$@©<·ÒQ•Ññññæ¨{t<§=%BYÌÒ&?«|ËnOÃ°>æTYãaÌ˜1ê»ï¾3G@xOù°§gEaOí©#r\\²&…\\–À¤9­?súó0F_£?õåùÁÁÁ+K3\'<<|tllìáPÔ\Z×^{­¹V†„4Ögß\\ÌS)	~d±Ğİ»w«œœœü_şşªI“&E`‘ú=ĞŸ¯¨#F„.Y²äc~­\0\0\0¨öĞA¾]—aUÚ¶m›ò3Oõ¾ÏÙyÕûx‡\08o’\0\"Íq½P€¡Éiì\0£\"Ó%ä«æ>;vìğ~ıR‘¤L38pà€ÙÉüşûïÕĞ¡CešIÁˆ;vX E:éÒéLOOW×\\súÏşSäkØë.ˆ³M¯°I\0!‹V:Ã	\nõºOŸ6×yQHÈ,öïßo.8©;·E~†¤sl¿¶ü2ÒA¦pH‘°¢<äy¬×|Â¢d+Á”µK¬œ$.[¶,­’>ª\rä3g‘ó~ö×¯Ù_ÿ¼iús¡_ëeıZÿ+)p8Û\Z2MEÎbF‘µ?ä4£²ö…œaÄ9JEB§ûï¿¿ØõWd‘V	—$x»“©\0\0\0\0ª=tĞSCw¢\\U<ôíÛ÷ÄòåË›êœœ\"¡.A ¡£îèÙõ!··u<Thé¸ŞÒëz×â^Ó;À(+}Lÿ»ä’KÎ+Ïc%H‘àAF,HÇQ¾áşæ›oÎX‹Á&AƒİiOKKS«V­2G	8ƒ…Ê g¡uœ\"\"\"ÌáúöºÎõ„ŒZE(¥Øä›z9†­gÏEt:ÎtyÈb™úè÷ñÇ{rÆ~Ò!·‚!	#ìQ2B$:Ã	ëzº]ÖşÎı¼:Âù×¯5^¿ÖÇú˜ŞÎÍÍ]k‡O?ıtXi!£Jä½–u;$p4ÈÈeb“é62ÂäÜsÏ-ñù$x˜<yrŞŒ3\"GŒq7#\0\0\0\0TkèĞ¤I“œ”””@çz_kÔ¨Ñ	İQËŒŠŠz¦\"ÏÖRw<;:¡mõó`ÈÈ\n¹_Yg°(|Õo•£ózppğû²˜à}÷İg”ç8etÃƒ>¨&L˜`~ë/óôålÅuÀeÑEç™\'d”ƒœZÓIF”–Œ`øïÿ«~÷»ßº]‚ïÑr:Mï Á~!S\0Şÿ}õÄOÈz æˆ\n9[†3t5lÎ‘!Œ’ˆ~ÑzÍ>»ú5°êjm[Z¡@*!„ª€@ÇçË£å)VØñcÓ¦M#ãââv.\Zy6wÜqGÁN„Œl‘i/ÎPEF>¼TÏ§_7øÑGõÌœ9sñˆ#î\"x\0\0\0\0Pm¡C³fÍâtgî¼ªvïŞı“Õ¹¯k}ç7Ó±g{Œî:äê¤Û:«…«uçzÖ/¿ü²¡¢g±pàOú“9²A:àfï¸kW5lØ°‚}œSJì¶HgÿÍ7ßTãÆ3¯Ïš5ËÜÚxù6\\ut†²0¨<§½^ƒ„2µC¾)—©69¥nØ$à(Š„\ròš²ÿÄ‰ó{üú3óê«¯*İ©5×}(Št %D)ï›Œşuşö·¿ı½4û3&(++ËüPK0¥ßß–Å„Âmc¤Pš×°>/Nè÷#\\B—¢Öp(HÉÚvı;YsEÖøp.:y6—\\rI£Ç<múôé\0\0\0\0ªu¤Ã—111çÉúUEwÀ¥Gõe5×¹„2~ı©İ©NÑÓ·òòò^/n~yØ|™R!EÈú\ròÍµM:îNÎ‘²ßèÑ£‚	ûqÒAµŞ?Õ¿ÿB÷!×‹šÊ!£\ZäñNÅ­!ƒùw’c’RJèü\n:ªŠµĞclyk2³Ì¤>d­²6	edZ‹Œ\Z‘€Çùœ;v4–,«>}ú4<yrÒôéÓ………`\0\0\0 şª¶Sf<yò…èèh÷‚>”µÿşôvy5×¹Ÿ8ÈŠ	ÁÁÁİ¢¢¢&WfàPgàPÔuoeù†»,¼_¨À¡*¸\\®z³D—?ùùù]$·\r\Z4Èœ*Q^r*Lïu*äúí·ß^îçìÛ·oóşıû§êçùtÌ˜1Í\0\0\0€z©ÚF:<÷Üs?=òÈ#wîÜÙ½<ßĞ–Õš5k>ğx<]t?¶šë¼Ò¦P î(a”ƒŒœØ¢ËGn·{íÑ£GcœŸ›ğğğ1úú‚>}ú”z-o‹/6<u2ÒA½ğÂËõœ;vì8¶qãÆ&úyo’uIx‡\0\0\0B‡*wòäÉ¿ëÏbİYò/ît|•$eáÂ…êĞKÕøãNÎËË[Y#\ZP{É\"‘Ú½ıP_İ´Éš²Q¤©S§.|òÉ\'3gÏùĞC¹Ë\Zàíİ»×\\›Ã9µBÈ$Y@sëÖ­eb!ÃŒ3‚õs\\²d	S+\0\0\0\0B‡êñöÛo/7nÜ”O?ı´×-·Üâ³×™9s¦Œrè‘U]?kTTÔL>n(Á]~lĞ ÁÚ²˜6mÚÒ‰\'fÏ›7o¹Şú•vÄƒ¯¼òŠyzT›sÄÃÉ“\'Õ;ï¼cv(íT›­[·{é¥—ìÀE$\0\0€zÎ]İ ;6\\±bEæşıû}òü»wïşhÛ¶m7ëÎÔŸ™Î€š***ê9]–—w*Âœ9sV6kÖìN½ÍÛ¾}{©óá‡ªŒŒŒ‚ëæâŸ²µÉY@–.]ZªçÛ·o_üìÙ³	\0\0\0\0Øª=t5²³³ÿ<kÖ¬ŒãÇWês9rä¿/¾øb_—Ë5922òGŞnÔe<4jÔhØÜ¹ssÎ<$$$˜§!u†ÁÁÁê©§R!!!·:uJmÚ´É<õiIdJExxxSÃ0Æ8\0\0\0\0°¹kÂA¼ÿşû‹ÒÒÒ&üãÿH«¬2ÂáñÇï”——÷jddäû¼Õ¨æÏŸ¿\"33sğË/¿œ]RğğÚk¯©ììì‚ë2}bìØ±fà0~üxTpŸ~>sÿâÎ4c¯á`ÆHİÖVò.\0\0\0\0°¹kÊ,Z´hÁÉ“\'ÿüì³Ï¦®Zµ*½§ÒLyé¥—\"¦M›v…Çã™ºdÉ’y›QŸ,]ºtmNNÎyóæe<lÜ¸Q>|Xåæş:Û¨K—.êÊ+¯4/÷ìÙSõîİÛ<ƒ…p\"==]Î\0sÆsÉ\Zö¢‘\0\0\0\0jlè –,Y¥;B}t§é»|ğØ;2Ëğğ¬Ï?ÿ<êî»ïşß–-[Îs¹\\×EEEEğ£>ŠŒŒ\\}úôéÛçÌ™“µsçÎ‚ÛSRRd4„\"8İÿı…®7®Ğ-’’’Ô»ï¾knm2ÂAÔG0¥\0\0\0@QükÚÉ\Zzó‡ĞĞĞ;gÎœù@```¯.¸àxÿşıwëÖ-°yóæmeèwffæ1İ:ùı÷ßïß¸q£ßşıû{äååuÔŸğ>‹F‚à!rõğáÃo5kÖ¿\'Nœ$§ÓlÖ¬™Ü~ÖÇÊt‹’ö³ÏR!ƒ¼µ\r\0\0\0 V„ğa¹Ş,9rdÇ;wŞı[}½Ÿ.YºÈ„ó¦ºäè\"ç÷ûB—¬À€E¦ZHğ0gÎœ?üğÃ—]v™_EŸSÇY*\0\0\0\0Ë¿¦à¢E‹ëÍ«\0(#Gğ°jâÄ‰\r*<ØS*8-&\0\0\0€ÒpS@İ\'ÁC^^ŞĞ9sæœ.×*­ö¢‘Š5\0\0\0\0”¡Cmx“ÜnÃ¹¨ª®÷CzS\'Ö‘µ$x˜9sfÖ¶mÛ²ËòXç¢‘¬á\0\0\0\0 ÔıÙjxÍ—tiU†ıuyè,ûœ«Ë_Î²Ït]\ZëÒ[—«­ÛnÔ¥EM“‚‚‚~9uêŸÖjœœ£7Ñuåç‘À \'\'ç¶Ù³gç”6xÀÁqZL\0\0\0\0¥VU¡C˜.ƒ­’muöåòSºtpìw‹.]¬b\r²ÿùE<çÕç¼@—‹×¥üÉk	Òt‘3\\´±n©Ë‰šş&l<yò$ŸÖjª7êÒÏ$S-$xxé¥—²·nİš^Ò¾ûöí‹Ÿ9sfˆ¾8š)\0\0\0\0jjè !Ã\'VyB—÷¬Ëít9îØO:5‡¬2WåŸ¥BF\'XÛcäxN)±ËÇ¬ëâ\\+„pã!Gà ì9Ôä7)++kz|||a|b«VlRRR½ı ®ı`<èÏÓ°Ù³g»¶oßZÔ>²†CxxxŞOF8¬äã\0\0\0\0 ¦†nUx‚]º:öé Î©0Ä\n¬}F;‚‚{t¹\\å`ÒÓq¹“.ë­ıXAÄÏV!ÄeºL±K¦zü]qQ£\\{íµ›uÇo×Ñ£GùÄV¡˜˜˜Ïu½½şúë7ÕÅŸO¦Jäææ™5k–kË–-…‚{\r‡¼¼¼{\0\0\0\0ÔôĞÁ£\nJ°‹œÓ^¤/Şº­—ÊŸRñ.KTşi=ÿ§ò§Fd9S.Ë:§¬rÚqùæ\"AFMÜ¦òG:lÓåŸÖqı?+Ì8R“ß¨¬¬¬Q±±±©©©|j«@JJÊª¤¤¤[=Ï¤ºüsÊˆ‡ÜÜÜ;æÌ™ãúüóÏO._¾\\­_¿>Ñ^Ã)\0\0\0\0jCè dÇ;TáÑrÛ9`Âß\nö8n¿Rıºî‚÷ñÊ(…Véì¸ìÜïwº,Ô¥½.òí1¯çø°6¼Qƒ\rúQw‡ìÙ³ç$Áƒï‡İ»w÷r¹\\ÖõS×^;xX°`AĞ| Şxã\0\0\0\0µ)tÅê:ª3G<ôQ…r”\'ŸWù£d‘I S!ÖX÷özŞcªè5œç—üN—{Uş4‹ZmàÀÒ9¼sçÎ©qqqI¬ñPébcbbŞÜµk—]ëú®7n	\\.×r¹,[\0\0\0\0µ%thUÊ¿„ct¦ËuVÀ0B9mƒ=£©×cdd„s}ûr‚cŸ,Çã®¶/.Tù§æ¬ÁC^^Ş•±±±[¿ıuhm\0\0 \0IDATöÛãû÷ïß‘œœœàñxø4—ƒ®·C\'NœøÏ={\"¿şúëŒ¤¤¤nú¶ëëSà`3ãÎ-\0\0\0\0T”¼Æíº¼¦Ëµº´Vù§Ã´5r\\Şa…?[×e!È‰º¼¢òO™y¸ˆĞÁyZL9İæ\'ÖåO··°¶öceôÄıÖcs­°A_Fb¬©\rošLµÍš5kúÆÇÇÕe€¾ŞÌúÙP6²€¨œAå]æÖÕE#\0\0\0 .†rJÌoTş\"Ò±“é‡÷¯p\\ö89=¦„¯YÁ€ççº<XÂkes»Lßé;¬ë_ë\"óôe\nÇÿ©üÑâÛÚöæİpÃ\rÑzÍÇ\0\0\0\0Pù:tˆ·ŠØRÄı‹Šyœ„ÎÑ\nßëòÛ³¼ÖÄî{Ûqù¸Uìçı\0\0\0\0\0•ÏM\0\0\0\0\0\0_ t\0\0\0\0\0\0>Aè\0Ô]ö8ÛET\0\0\0€ªBè\0Ô]UşM~²®Ëb­ı©\0\0\0\0UÅŸ*\0ê„Çt¹GåŸ†6]åŸ)fœ.YºÜêØ/“ª\0\0\0PU€ºA¦M¼¢ËëºŒÖå\\Ç}©ÖV¦Wœ ª\0\0\0\0TB n»\\å-¬í8ª\0\0\0@UaM nKĞåk;^—ª\0\0\0@U!t\0ê¶Ÿ­\"m}Õ\0\0\0 *1½¨ä¬S­Ë2šAB†?ê²\\—u™«ËkT\0\0\0€ªDè\0Ô\rË¬â$k8Ü©KC]&ë2G—‰T\0\0\0€ªÂô\n îjhm3t	×åIõëh\0\0\0\0ğ9B îò^4Ò\0\0\0\0 J:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€O:\0\0\0\0\0\0Ÿ t\0\0\0\0\0\0>Aè\0\0\0\0\0\0|‚Ğ\0\0\0\0\0ø¡\0\0\0\0\0ğ	B\0\0\0\0\0à„\0\0\0\0\0À\'\0\0\0\0\0€OøS@ı3bÄˆ\'\\.×ÅÜ=544tªó†¨¨(µ\0\0\0 ¬é\0ÔÇ†ïvGS\0\0\0\0|Ş÷ \n€ú\'22rµa§J¹ûaj\0\0\0@y:\0õ×ò³ÜŸ\'ÿ†±šª\0\0\0P„@=eÆâ³ì’#ÿ¸\\®EÔ\0\0\0€ò t\0ê©†\rnÔ›äv	Ò%1!!a#µ\0\0\0 <€z*\"\"\"Ëår}RÌİùÇ0Œ•6lÈ¥¶\0\0\0\0”¡P†ñV1w™ë9¸İî¨%\0\0\0\0åEè\0Ôc2uÂ0ŒŒ\"î\nĞåp||üZj	\0\0\0@y:\0õ˜Lp»İ^7ÛS+V3µ\0\0\0@E:\0õœÇãùÔyİ0uñj\0\0\0@E:\0õÜ±cÇVëM¢}İårùËuÇó1µ\0\0\0 \"€zN¦P¸\\®Ï¼n^½lÙ²4j\0\0\0@E:\08ã,.—‹³V\0\0\0\0¨0B\0*((h“ózƒ\r6P+\0\0\0\0*ŠĞ€ŠˆˆÈ2c¯\\v¹\\ôõj\0\0\0@EùS€oèN|ĞÁƒÇ§¥¥ÊÈÈè‘äñxjìñ&&&ªÍ›7«Ë.»ìÜ±cÇ\Z5õ8].—Ñ Aƒ›srrföïß}-ùHôVù§#±®/Òå{]§µÔvT[ĞhG´#ÚíˆvD;¡P‹éÿ”ş²uëÖYYYY\rÛ¶m«¤„„„(·»f.ºã;j|İêÿà]ú?ü–©©©ƒ~õÕW?dff\Z4hPL\r?tùƒîër]²¬?ğ^ÔÅ^CÃmı^ş/­¨ö¶£Ú€vD;¢ÑhG´#Úª\n-¨dqqq+:ôj‹-\Z^~ùåªsçÎªiÓ¦üÇTY¿´t=6iÒDuìØQõë×/°S§N}$_·nİ\Z~è¹ºdX—å»{­ËÛtùÅ*\ru9Ì»L;¢ÑhG´#ÚíˆvB\0EşÇ¤Ë‹.ºHuèĞA†ŒQ)>Ö¾}{Õ§OŸ`ıŸÖ{k×®½¥–öÇeù#ïW¡ÑhG´#ÚíˆvD;¢ĞÀ¯dèİ†ôèÑÃLl½N;¦G¿§ö­Ví]÷ŒŠÛşÊJ=BÅU‚F\Z©Ş½{‡è?Şûì³Ï.®Á‡*ÿyş]—L]úêrïíˆvD;¢ÑhG´#ÔÊvB êÈâB‰‰‰³dÈ]qÿ1ı¼}JKÜ«<yÙÊğäªŒ¤ŸTÜ¶·ùªÿƒêÚµ«ÇÏÏon\r>ÌÎÖzÉº¤ZìvD;¢ÑhG´#Új_;¡Pud5cY\\H†„%éĞ×*7;ıŒÛå?ªÄƒ¨ÀJÒ±cÇæşşş¿ùüóÏ¯ª¡‡ø/]Ğe¾.Tşb^ ÑhG´#Úíˆv„Ú×PJœ½¨rú$YÉ¸¸¹~™%¤Ş’–£ò´nİ:áÈ‘#CõÅM5ôwéòˆ.Su	×eŠ.W;?Nºô£ÑhG´#ÚíˆvD;¢ÕøvB jÈùšå?§ây9Å?ØàÏ•©eË–ôNjèáÙ£Ëöé¯òWÿ³Ê_IÜ{ÚíˆvD;¢ÑhG´#ÚQÍmG(ã/\0$çkFõÓïC;•¿(VMÔØqù\r]Æxı\'<´#ĞhG´#Úíˆv„\ZßPJŒt\0*Çãá|Í5„õ>ÔÔßmÑ^×ÿÅ;F;¢ÑhG´#Úíµ²aÄˆO¸\\®Š¹{jhhèTç\rQQQõâ<¬´& \nŸSì}ş\rHÒÚ@;hG¨õk·;šZ(¢^¨À÷šw¾Fù6:ãv¿€`Õ¼K* ´#€v„Z.22rµÊ_„µ4×—z!t\0ª@ãV=U£–=Š¼=¤õET@;hG\0íu€aÿ)å~«ëK:\0U$/\'óŒÛrOŸ¢b\0Ú@;hG¨#Ãxë,»dË?.—kQ}©BÀÇ²Ó«¸mo«´ã?œq_ú‰ı*në›æ>\0hG\0í ¡vkØ°áF—ËUR¨KbBBÂFB\0vòèvıÓ[*#ù`±ûd¤R±›_UÉqß(ƒs;´#€vĞPkEDDd†ñYIûèûWnØ°!·¾Ô	§Ì|@îcû>1ïÒğäe›ûŸ:şƒj}ş`d’ Ñ\0Ú@;B-4_—;‹ò\\.—ŸÛíş >U#\0„»´ÿ19Ir~hËëT @;hG\0íµ”L0ãŒ…?$pĞ›ÃñññkëS}:\0> 	wy\\* ´#€v„ZJ¦N¸\\®È\"?†±º>M­L¯\0|à‚ÏQ	¨tíÛ·O9zô¨êÜ¹ó)Ú@;¢vD;BÍeÆ\n—Ë5Öq“,ò!_úQßê‚‘\0P<ıôÓaÉÉÉ³nºé&uüøñéO>ùäj ´# f:vìØj½Iöê{\'z<ë[]:\0@\r7yòä¡qqqï?Ş}Ï=÷¨‡~Ø­ÿ#{kÒ¤IwUáa\\§Ëÿó*áİíˆvÚí8“5…b½×Í«—-[–Fè\0\0¨1ä¥ÄÄÄ¥&Lğ»ôÒKÍÛúôé#èù%\'\'¿[…èİ¯Ëw^åŞ!ĞhG Ñ€bÍs^q¹\\ÔÇJ t\0€\Z*<<|ôÏ?ÿü¾|£dÿgëÕ«—š8q¢ù‡Şƒ>x{Ò@¯’Á»Úí´#ÚP´   MÎë\r\Z4Ø@è\0\0¨1àÅÆÆ.¡«ŞàÙä¦GyÄ/--mÉ=÷Ü3¤\në¯’Ç;Úí´#Úğ«‘#Gv1bÄøĞĞĞeYYY»Uş’ÂĞ×wèûVèû“ı\0\0ÕõŞHû<ùC®$ò\rÓ£>\Z /.=zôÍ>>´Á^åïhG´#ĞhG€Raaaÿ¿½ó€“«ªğ›ÔE‘€€ˆ\"*Ö?ˆˆ ÅB“\"„$RADQ0\n‚(ÍTAQA˜\0A‚ Òl@h‰\r‚”P“\0	$ÙÿıŞÎÜ}ÌÌÎfûæû~¿ûÛÙ™7oŞÜ¹çİsÎ=çÜ½C»aùòåÿ)•J¤UìÚ&‰Í]\nmÃğÚŞáï÷–-[öĞÈ‘#o\nï9P§ƒˆˆtÇsÌŞ<ğÀ…„°¶¥à¥ŠŞ×¾öµ!a’»\"L\\»vò%\r/+t—ÿ”­ØnùúĞ\nmºó‰(GÊ‘(GÊ‘¬ŠŒ9rÃ0Ş¯e‹ÌĞvmH;Şş‘püÅá·>|\"\"Ò¥°¢´hÑ¢™i‘®FAÑ3fÌàAƒ]1bÄˆÎ,¨uYÖººuh7g-y³Ã²!­?\nmT¶\"tPD9RD9Rd• Œñ‘¸³¹¹y—øÜÀó”£#8\";ë¬³²Ÿüä\'ÙôéÓ³Ÿşô§Ùøñã³ WÙV[m•\r<8=Õ¶á}wõ×¨\"İÌ~ô£ìÈşùÏf7ŞxcÍãî¼óÎìšk®É®½öÚší?øAÍ÷ssûïÿÛğuq-³fÍªùúc=–İsÏ=•ÿyüË_ş²æñ|ÇÅ‹çÿ÷¿ê;Í™3çÏñ½–.]ºÊ‹O<ñÀyóæ]´2\n^ªè=ºiÈ!—u²¢·nhÿ—­(ÔÅÿd-!ƒg…Ö¤)GÊQß“#åH¤C‡=0uùòåkEgÃ{ì‘Mœ81;vlöÑ~4{ó›ßœ½æ5¯ÉÕ«^•½á\roÈ¶Ùf\"‰²ïÿûùñ¼¯ÌêD=Œ\Z5ês:Dd¥Y¸p!{öfm´Qöw¼£•±ñ×¿ş5=ò÷¿ÿ=7²l×]w­4nVk®¹fşøcûX6wîÜšŸ5mÚ´ìá‡nøÚ¼~:äë_ÿúì‚.Èî¸ãÜÈ™2eJn²ÃíŸøD+ãŒëÜqÇóc=öØì?ÿùOş:ßóÜsÏÍs®\'Ÿ|²Õç¼ôÒKùëÀõc0ÒüñÇgO<ñD¿TğÂw½°^‘®FÁ³>fÌ˜ÎVôÉZBWßSşŸíÁĞşÚ×B[¬)GÊQß’#åH¤C\"f577çœ	§Ÿ~:E$³u×]·¡s0Çs<ïÃ9	ç<¯¿E<ètéFN8á„lÓM7­÷ßå1+š¬‚¶eĞ,Z´¨¡Ïºï¾û\Z>0jššš^ñ\\Ê7¾ñÜpY°`AvÔQGåÇsÌ»Şõ®ì[ßúVö–·¼¥rìZk­•}÷»ßÍ\r\"Á@|ík_›ıë_ÿÊ\r½7½éM¹w7Ş˜o»í¶ü5ŒÈwŞ9_1şÇ?ş‘ç×½îuù¹Ÿzê©üq‚Ö¨à5š3ÛåĞÖ¦Áƒ_Ú	9µë‡¶Zhç„¶ah‡…¶iÖz5)Í«U”#å¨È‘ˆr$²rPÃaàÀ?ŒæÜ“O>¹•ã =ğ>Ş¼$‡sƒÌlÚ_úL¡é&XiÄXHyùå—+10Š\\}õÕÙ A-¢ŠáAˆÖ\r7Ü\r>¼îçZ®øyúé§³[n¹¥b ±r¼Ùf›U^gE”×/¾¸¥^ÓoûÛ<ŒĞqŞ»öÚkg§vZnøpMúĞ‡*ïıãÿ˜K;ì°Cş¾!C†ä«Íá&yä‘¹axÅWäF$|ğƒÌÎ>ûìüŞû¥/})ÿ?ûÙÏ*ç<äCúÕ˜ˆEº>úèŠ‚‡û…/|áÇÒ÷©çü…^È;ì°WGª\0ãŒ‰ë¸ã[í¬³Îº<LZûNŸ>ıÚ•¸ÄõBÛ>´SãpÌZV˜Ø‡ªÌk‡F±$V˜Æ2ì”#åH9êır$¢‰¬<a.>?¦Tá0zôèJ\nÅÊB&)8zè!\"Õâ¼ğw»~Ñg‘®‡•×·½ímÙvÛmWÓ°©u³Â€\"œUKŒ|àyšza„VsÜ³Ï>[óŒ½÷Ş»rÎ5 \\Äÿ7ÜpÃ<¬;‚Á9B³O:é¤ÜĞ!,ìÛßşvnè_äª~øáy:Qš[\r?Ø`ƒ\rZ]Ó;ßùÎì®»îÊ®¼òÊ¼èN\ZfÎ\rxÛm·í7c¢V‘.Bíø˜|’É-¯aBÿ¤ˆ00<ğÀVy¹Šø«Âûg®dh+¹—‡Wù¹ÃCÛ‡!Š¾šuCH«r¤)G\"Ê‘r$=	Ûb†9ùã<¦‚:RÇE&“\ZÛö—4\"İ\0yÜKLèÑ !4š¿![o½uİÂoãÆËW/UQBµ9_£¹ÛÏ?ÿ|+C†•‹4L|Ø°aÙ«_ıê¼\n/«¹ùÈGr†Ç9(\"eÏlzo½õÖlûí·¯|¯õÖ[¯òİY‘M?‹°ğ·¿ıíyØ<F7ÜÛo¿=_\rÆ]½ç®$ôû7™dÂwî”è° àR¯H}¶şúëWşgÜ°ªÍ\n=`”R ®ğó»­±Æ\Zy¿aÅê¸ã£ŠøŒN.æÕåı¤)GÊ‘ˆr¤I/_Œ¨Ã´²)µà|iÄfssóçu:ˆH»Àh š>¹ç¬h®³Î:•\\tÂÂ}ôÑªïãõ÷½ï}­r½êñ›ßü&ûä\'?™í»ï¾¯X‘¨FÍÇ?şñVÏ=÷Üs­<·(Lo}ë[ó0JnŠ¬³jú§?ı)ûâ¿ØjE—ü6¾!á1§ïGxügœ‘G<»|¿ë¯¿>ûÛßş–çœ_tÑE¹²ƒ‘œû¼óÎë©ŸîTö^ÆŞÂ0YQUx×áÃ‡¯Şï‚¶ŠtŸ®.½øâ‹ÙùçŸŸÿ.ŒÌ´ÿØ–)ñŒ·\"ôí¨èuÁ¾éÕúéÙĞO—w¤Ÿ”#åH9êZ9‚®Ş†s§;vƒ¡j5ˆdŠ†lQŞ‹…RH¥Z0ê½¡ö\n¤;Î´g7åhÕ£z*AF\ZÙUˆ±IàtÜ#é˜Ev™RHãCæª³¹ŞNIµæ´t×$ÒôHÑk‹¢c»=Å˜{»pÀo\n>ÊcÆ8N‡®\0§]=´-5$t:ˆH›0qp³g3ælc8¤æX\r¥`\\qùóŸÿœOâÕV\rjİì™tP È3c…³xÎ\"çœsNö™Ï|¦Õswß}÷+rç¹~n‚@Tõÿõ¯]É3Oa’¢rş3Ï<SùnÀ÷ÃèyğÁ³ƒ>8)Oaµ$®àòŠÕQŒ‹Eùº“R©Ä¤t`˜¬~¾óCa¢ºÉêĞCmh‹®“N:iTTğÚ*ÒÅª>ı°Új«UC±£ÓpZV÷7ŞxãºçCÑ3fL¸ìÓ»z…)ô½ı&åù¡.mO?)GÊ‘rÔur”ñ®Ş†stĞAÃ…è!nÕ˜:uj>¦›OÑÉÁ\'%*‚,r\ZµZ.¼ğÂ,Œ…Š’ï\\M˜0¡¦ÑC´QÑÁQ<9Š+˜ì\r>®§\'åG9ê]rT\rÆ&Î)\Z…|ãc\ZsÎb\n\nN8Æ,éu8%ÇÔù‰uÆ7cû6óD*“1…ã\0yæ9>§XccÆŒ¹ó»]vÙeùçE‡!ò£áRŞıîw·Š¼üòËó{EQnp&½ÇµR¯è«_ıj+‡$N«ZÎ¾&CK—.İ;DnŠó{gÁ½µàÜ¯¯ÛB†‰t(ı¬˜–oXù–u<÷Æ7¾1WìÂM®âÙLa (7{&¦Ï}®şÖ½ßüæ7³3Ï<³ò?Û^{í•çwW«X’ÆªD±â>!ŞÅ•ÔCï½÷æŸË”ÕW_=WHù¼ßıîwyá:&L>‹·£vÛm·Š!V&µ?üá5WÈzh²Z3L<£ƒ.^¼øÅ01_»rşüùW‡‰ÿKAÁÚ7(§EºÚbŸ}öÉûU% |e\"|îŠ›ø AÙşûïßĞùÂç®6zôèåãÆûyPô>}É%—\\İ\r]E!$ª5ı´$Œu¬‡Kjõ“r¤)G]+G‘tˆ»ÀÄ1ÊX\"7¿ìˆR/¹ãıéÈ¿Á)§œ’]„ß3¾#ôá»óŸG\\ Ëü&üND2![¢v¸nD!q\r8‘{>óÃşp+C,\Z\\¤JEù ú‚ˆ£x×Æyù|¾{èãü/²Â9¹ÇDƒGD=9SV-9ªF<Pëb—]v©ìHD$i8r\0\'N0\"ë[Œã÷¼ç=y´\Zğ<÷şÔá“‚ó#Q›—^zi¾R:ç ßÔçÀ™Aeœ|ÎtÒüb4\\*“Èïî»ï;Ù·‰\'¶ªİ¤7\"¯89;î¸ü¹«®º*?7s¯ãXG†z3ÊPxn‡ø8Moì\n8ÿ_şò—ø/Ÿ;®/ÛBF:ˆt#(0x—Y5!\Z%†Ë/ùËùªNqõ„I€‰	£ƒ‰å€JöµøÎw¾“¯*¥+I¼÷ÔSOÍW†	KCå˜Dx=N(bd„g£¦^u`bÂèÊA~Lt¬Ä’;^\\æ»29aT‘«Î$ÄçGeIo>Ê]„U®èG¡M\'5àøŞ¦ì•A8”p½ğ{=&«©·œ¥\'Ÿ|ò’Z9³µ t‚B($‘TÁÃşÙÏ~¶UØk[l¾ùæ¯ŠA)œûç]½ÂT…¡áúG–ûiaè£+WfÅI9R”£ÉQ#»À0ŞŠ0ÖãØ\"R€FÕv™\"¤$ã6—?	Ô;aO<9ûÕ¯~ÕêØ)S¦äÎ7œ‡jD÷ c\'xbîD(†¤}„\\:4—/$®‰óÇ(ˆ\"8æb”c!\Zx4œ\Z8\0YBn¸`t‘ş\\[*÷á=UE9ê=óQ5pÎ0™¨ÁƒŒ0vHGá9îÁ!€û6ÑBD\nàOïéŒEÒå ¦×Aqİu×e<òHî|cÌãô!MiË-·lµõ2‘CcÇÍÇ+ó´87¦AZ_ÎÃ‹Óç2‡¼á°hk[êÕ\"(ú\0õd¨²=U[=…BÔ	›õuÈH‘n\0#„É„Éc	P€UJ¶Ÿ\"?r¿ıöËN?ıô<|I&Áû®D¥ç\'Ï/vÑ[\rd*xLQ,97EùŸK\r+&\nØ¥0éğXÙ@	\nBş<ùñ(œŸÿüçsÏyTĞPğP\\	7gRD¡ãxÂ™ kŠ+Ã\\ÏÇUê¢QW¸Û‚‰™ë	“ÄÉ=ôsmD˜¬F 4|úÓŸ~<ôÙº¬(µGÁ‹0ècÂ1ScšşÁˆŒıİ‚Ñ½úá‡¾èÇ?şñÌ0‘Î×úïè\'VœøQ?I?…ßë¶ò¶•#åH9ê¸Å]`øîDik˜8Îpò!sŒ5Œ~B«[)˜Á\0BÖªE¥)?\\òˆÏö²¤)-Y²$5Ÿ4iRşYE8õ—¸“2HtaÛ8b¤Ctş¥‘È\r†^;8úˆ @¦æÍ›—§ÄUZ\"0hœÇÇ`¬qmq§ÎE¤H½Hå¨ËQ=H1aìÎœ938 Â‡ñôûßÿ>wºïÃDÄ¨=æ\"pÔ-[¶,O‡}S©ïÀÜBã¼\rÆ9ÈXÇ!NZ)}È;Q¿‡y\rg5ÑE8&p20¿1¯01¾I_Â™ÁnJœKüÆÑyÿ2¿Å(\r@ö9/óóojˆóşjsi{éa9j%C|­ÔÑÖ•Î¿Ni“t4Âÿé\n(áŞiÈ7+­m@ÎÏ¶}õ`E5®îrã¬u<Jù¼E˜äâJi”&T	aŒy÷1÷ÿüç?¯ƒâÁhJ¿3[Æ~HwhC¶|«7üö¡OÖÃH^/ÂÖcIˆ]+LŸúÔ§:2‰¯Y>Ï½DL6B‘†´r¤)G]#G4Œ¸ç3v1ìk™FvIWÁ«ü­Æ8éŒı`çÆFFj\0at±ZŒÓ—(\"¢€ó4Ò¡Yáx€³ãçÅòXe.:899cÜà\\ˆ†\"ïåz\ZYÑWú¯Õ\'æŒy¢ˆ’#=~ŠµAp–ÆÑÑ‡Ã\rÇyÇ¼7ubà#¿D\Zİwß}•ëL|DKÄy\rçÿ3ğ?òÇ8&eƒ1ƒ¯ÑzGE7æaîqîå»Å9²3èerTñäwÖ6™µ(Ücš²>N‘¢–bÔ((X(M\Zäâ±‚Ë$\'9Âûê…™krrë]/+\\¬~DEe•÷yä‘¿I\rjßmj»í¶ËÈ0AÒ‰?W#],+İª£‚‚üäóÏ?¿ö=÷ÜÓpîl”‚R©ÔJ‰Gñ¦¾\0yÊ+ÃÚk¯M¬ækÂy;se©‘~âK`q´*m®ãş`¨oÜrÄ*&«?¬^’ö\"D)`°°»C„(VE«¥0®Q\"	/9ßi¸5!¬bqõ“ëÀx)VqGY¤âuºZT3.wÊ‘rTm<³zÈcLÆ]`¢±€B†h§siM„Š×ƒ¾ÆÀñQ&Ëfşş+®ÙÁ(c•5Vëg¾ºé¦›Z€8\n97²‹ã`Ñ¢E­\"¸öâ6·|ßøıˆ6â³87Ó-!qBàTàuœ EçÇ6šB ­ZóQ4‰PÃIE4s\nıƒ¡sñõ½ï}/O=bÜ20FHM!*€z¤ş\"ÇÎmd B_ãˆ`.*FÓUçéHÈÑDU	AºQt8XHIY°`A~ Å‚èä\ry©VÓ¨Ú<…¼ñ98(ódyeõŞ.£•–¡06–‡1š+Åİ©:›tWnË:D¤GàN8^oVx(D‡²ÆóLéäpÁäÏ¥ù€[l±E«‚^±ğO$VùŞf›mjÃdšŞ1pâ„Å$Eøk±H^WâŒöõ¯ıäÎ:g0$kMP/S©—ú\0\0IDAT2ù„Ihhœ˜Âÿ‹Âÿ7†6mèĞ¡×N™2eñ	\'œ°ÿÄ‰§¤İ!­ä·-Ö) ì’I˜ß¦½!­aâ~ü¼óÎ[-\\ë~A	ººú‰~YúÅ®„‚W­Ÿ‚ÒÕÜ“ô¡‡š,(p;µœc$l;æ§ÀXå½ŒaVW¨Îa¥ˆãPôIe•c‰âŒµd)-$Éï†üÄhƒÔ9‘îÁİåN9ê¿r„ñÀö¬ìƒ.¤‰»À`ì³²YM6Ù$ÿ‹ñNŒ{Î‡1•Ö.ásImÀ‰l¥[Ú\"SÈK­UXŞËoÇ{™cÚ\\q@¤ò‚|Äó¤‘´4ÒíkiìˆÑV?w†Qœ€{/sÅãÆ8Í¶Új«Ü)F$@\Zµ‡1Î˜¤áÔbS…û±ş	÷|ÆU½GDFjE~+Òöp„bAM!tDÆ?s‡t‰ ÷8ßx/\rGv”!RŠéE8ú¸n\"’ØIƒz,Ükø¼Ôêl9êˆ…ùu·7^ÃiÔ•NÎŸğ”NéVğHs£\'Ôš÷V§(\Z†+IÕ¼Ñ¶7âø4D;Ò*ßÕ®\rC¥£‰÷2yâYÇsßŞÕÖ^ÊÿÊŠ\nÕ´VcÅ§ütIøş7…¥ÕLqÚi§]zÌ1Ç¼ŒÜ™áïÀFW˜PäÈoNWÓÓ&yòùù½\Z]yJáã&LX-(\"tuµğpKÊ“wVVğêöSg@Q|.æ‘¢Jÿ¥5À`ÂñFepê1KK¢Q/gDÑĞAùŠOş(ˆ(tá7ÍÏ_T¸‘¡Xƒ\"…÷!©Ò¶\nÊrÔCrÔ»À0/Ån>#„Â©€1†S€ZrÎ9©üåØ¶\"ğb*+Æ¼‡ëEö0Æ5G¦Çb¾uÌ}‡4Ò±¸\r`5+ê?Dn¿ıöÊ®1Ê‘óQ\nã’qÅı7:é¨TË£!Êı‹Ï-n‡Dğ!Oœ/~Vµ4Bô¼øz95!Ÿ+H¢–c¹\'`,RYË‘_-B9%çœ\r8Yø8»‰ú#ò§ïÇùRtÀ÷Å¹(|¯»£Óï·Õí\nÒûMàn\"Ò­°…+´1Œ›ªÇl›ÇdLD°«•ÁÙn,*–ÕH)VW¹©ÆÕ\'&ª¸zÊäˆ7ï9¡{\\†Çàf%˜ğ½~ÄêÉD53´_ÅõjVFê½iÒ¤I³‚‚·_ø;³Ñªá¿øÅ/Z­dIM\0V%c¥yşÉê~[…|şÄ‰›ºCÁ++vCÛÛO±Êj[,(gäqSğ.…Šâô%[˜¡xaEƒ<\\©‘€Ãg\\ï´ÓNùš(•GuT6{öìŠÃƒ÷¤PHUÓ”¸!FKª„­br§õ°Q³\0Çp¬^*Ìx\"$<îê®NÆ]`€]`ÿÕœE8å0Jp4Äb­±h*ã–t¿hèõpÆgäç¦\0_­¨†9sæäòÀuâ\\ˆˆ+µ8ÓY]åZ9>%uØ¥‘Ep¼`@Å|tœ\'È×MŠbL+AFIOéH}å¨ÎGØ8®‰B`œ¡w1Şk9·ˆœKS›ÅÔ¦X\"MËcl}TX¯¼ü>È#‘¤9A}\nÊ2g±sÅ—™#‹õ†¢>’Öh 8%óã\0ç>ó8¿Qä’92•/œ–I±è-2ÔÜÜü»0–ö‹Nœ¶R”;çOı<:D¤ÛaÅÏ5Ê“^ë+HQ¹+‚‚D¨t…3\ZFí­òQ†ÂÈÇäÊÇ$ÄJ\Zç!â¢Zè^_„0»ğçæ è^ŒÒ›Û»2‚¢&ğáar¿$(öƒë)z((!©’Çj69[_FŒ”VRêmßDë¸qã†Q¨«V”:ÔO+Ê†¹²)8æˆ\0b<|òÉ•q±…rÄ¸Åp‰Ê+®±Ï‘-Œ ¢0°pÔáĞã½TµÅ·b•ğb¸9rÀ\nlqÕ\'Çâ ‰N‡UIî”£•£®Ş†nV7y…œvj¡DC(æıÇrŒ!¶ËŒN5\"(ä’ôøb8ÛÑ€!Cˆx-\'Ôg°òN´PµºÇÈV5#0î¢3$ŞÎ<óÌŠSš)8ùqLvå*§rÔ7ç#æ\"¾,\0áÜ¶>$u(RL5 : :Û%æR\Z`üøñ•û~ÑyMÚ¿[5C>Ê+!ïlM?Ñ‘\'æLÀÙ€ó‡#òK”=ğQ.qH2·–ÌÌ9È^¬#Dú\rç&\Zó\0óe\\+çªíÑWd(Ü›f-[¶ŒÄ¶ÀŒıâöÃ¤Ù³gFT*?5S§ƒˆtLø(‹l“•GŠÔ¡dÅ½Yá‰aÛJ=(b(Q…²˜NéşìĞ*ß(#œ—›.+f„ZR\'Å‘ë Sœ€ú(\'–J¥yMMM3;º2Õ+ößÿİ&Oü«¯|å+Cj)zlkW6\0BSü–D· ÈÇU‡_|1?¡X´0*xÁgßé¦OŸ>«/ôS{ X…¤_ˆ\0@FP~¢’G7Vu0XP–	[%§åíÌ\"ô%ÿO˜0¡å@øh_e9L·ôwJ!ôã)\rGFéÃiˆ±RÍ^äN9êrÔÕ»À¤`dÓií‘F·uó]#×V„•øz+®\\Cz©¬®l•åhÕ˜â¸Âñ‹#_iš[Q&Ò(Ã¹ñ}E‡:°j‘:‘4â‡0§àø+a~÷´ 1ÎÂ´ÀrtHF\'E-øœ¢#ëìO:İ´iÓ5jÔÍaÎİ‘”#¶7­–ÓQpò…ß\":n1cÆ<\"Òm0ÑJ=uêÔJ7&<âqRA`ÂA‘‹Ê\\,\0ÄäG®_½ŒF«|Ã¬Y³²#8\"OÙ@1Ã«‘FÅb&I7rŞ‹Jn_\"Üì¿Ó™ç»ôÒKo“Ö^gŸ}öG}tSQÑÃÈ$t7]=dxVì£•q€C	eUB:Ù!¥;sf;»Ÿ\Zå,NúŒw”^sŒwú‡oúÇCjdÎº4R%å*\raå~œœ“PUR,R%±Ht4°:”Âj\n«#¬ş}±ªÈrÔ{å¨†<û}•£>9U5¶\nsD[uv\Z©‰QÏáĞÖ|ÙkíÈ÷ìÇ2„2±#p:à éÌ¨\'\"–¯ºêªJ”C©Túq¸ïÈD¤ÏA®jÌ¹%š¡Xµ˜UŞbuéTÙÂ‰E†jMñüDEàÈàq1,ÏÀØ‰EûxÌê+¹}x·	ÿfª/;ºŠĞÿ×.Y²äS“&MZLˆ^„:Œc”¶ÌMéoŒ{ÑEUÂ\\%¼ğpDwäÌöe79VßêŒ]òRc£¨[‘al“»·Œ+Eq{¿(©sÿQHp‚Dˆ² ä›¨„bQHåN9QDz½¼¡s3Y¨rÓæÂB$åäÉ“—yªD9ÌŸ?Fè7#Dúõ¼Ô¬F°}+²õ Â>9¶ä¢³j[Ìym´Ê7…‘XQE,qvPÈ‹\\]BÄ)(µ*+zûï¿ÿãÇ¿ê˜cÉW˜¨¸^Ï!a%¤ŞqqE	ÏYUú”´rHcZy­Å(âñ¤¥ÛJÁºÔ™·¨%!n¥‡Ó€´öGæ‚¢P9qÁ1œ–<pœÕV©”;åHD9éP©™2ëPS‰ÚèìÈš8&MšÔüÈ#Ä¼¤ÿ•J¥Ão¾ùæ¥ıÂ~qÌˆô=ÈïÆ8¡alDbÊÅ~ŠÎ	ê6gIq<\'&\nãí¾ûîùª(7Í¯U[q¥rwºz\Z·å¤r1Ş^#Œ-Ò;6ß|óÜ#B_RB[CÿíÉ\nÓìÙ³—uÆ9QğB¿!„uURğˆj e-\0ãªãÕ J õØp\n£‡0ş;ì°ÜĞéD\ZàÔ vÛQå;ÖV‰°•ş¹\nœµPî”#åH¤÷C…ææfªáæœÿ¤K’\Z±2ğ¾“N:iÙœ9sb„i_2óşÒg:DúSTôÆ	Õ†SX­VµŠá&„E²‚\n2¤j°:ŠñUXå»¬Ä²‚K‘<¶Q\"—<^Å¤nºé&¸Æ½%Uôbk0F^•BX™ğÙ\nìÔSOÍ£È?ÆùpñÅg{î¹gÍ÷x±C‰#DOµ@U|Æ:ÕÉßQîpâñ|\nJ’ïÉ®\0ºŒòWåN9QDz/aL“öpxt<°x‡Ş1mÚ´ªÛ˜VƒãH;vl\Zá@qèã§OŸ>µ?õWÉ!#Òqn¸á†æb¥ßî#«+Šø4²¯roÛ{™ívÚi§>wFë®¼|ôèÑC7Ûl³í}_aí	9Z™â6›í}­¯Ér¤‰r¤‰rTŸ#FŒÎ-•JkÆçØ¹…HGûØ>–T%R/ˆxÄÑÀVØ³gÏ¦-_²dIª4P…úè3fLéo¿¡5Dú‹0wQÕàFŒšU­òyWb½}Ç7óØc¼Å[4Ü±i‘.CXge¶”¬çTè‡ƒr§‰(G\"}\"FùçR©t[iò©wŞygŞÚR)’Ç·RÃ¡?¥TÔú¢\"\"Ò½—_~yï‰\'¾<{öì—\ZUğØ÷ÜœYåHD9é^¨ñÆ;{i/•JäY¶§øã­¡}æ±Çûhu8èté…S‹¢7aÂ„—î¸ãçë{ß}÷Í7nå’1gVD9QDzÌù0çÃÀ7*•JÇ†§f†6/´ÅåCøûphÈÇ˜Ğ6\nïÙtŠş²KE-L¯é¥ŠŞ¨Q£†Oœ8‘œÚgßÿş÷¿\" \\¼©¹¹ù€ò¾Ñ\"¢‰(G\"=È´iÓp,L*7ÉŒtéµšºtéÒ½Æ_ºıöÛŸM_K«‚«à‰(G\"Ê‘ˆôVt:ˆˆôbXa\nŠŞ>“&M*İvÛm£‚sf\raQD”#‘NgDh$ÿ“!pVï»¶A{ãĞlã>oõĞŞÚÖåçv\rmm\"\"ÒUŠŞÀşğ‡«à‰(G\"Ê‘H—²]h&ÿSsáUåÇq7—¦Ğ¶ÈZœ±QtõÍÉÿß\rm­òñ8v+·MC{Oò?í3…kÀ¹À6šo\nm½òs„ö´NéE/üqË-·0ñŒPÁQD”#‘.a³Ğ~ÚÛCÛ£Üp\nlXş{|hëf-…!g‡ödÙAA{>yÌëßmaù¼—¼&ió’Ç—ÿ‡ËŸóÆĞ¾œ8`yùï¦:DD¤Ó!§¶©©i-·!QD”#‘.(†ÍC›ÚQ¡İµì6‘:	N);\Z\"We+¢Ş<>»`oÚ–YKíÉc¢#n*wùs\níûe‡\'–Ï‡Ããø²SB§ƒˆˆt.S¦LYd/ˆ(G\"Ê‘H—ĞTv`Ô_µ¤2Œ(;^mïĞ*¼ç‰lEÄÂ£Éc¢ –\'Çù@‡çÊmIòx÷\Z×Âç­W>×©åó‘úqHhô•NuËL‘,cw–Bû¿ĞnÉZ\"~]~şšò1ëŞóº¬Å)Á{Ş’µÔf :aë*çç½;–¿%yœìÚg³çÇ¬ò¹‡$¯ÿ¢¯uªN‘¦†vEhŸ\Z&cBûSù5¢Ş›µ¤XDÆg-iDDü7k)&yMò”Ç³Î‹İ’ÇŸJùKhíÜşÒ¡:DDDDDDDZØ%kÙ­[™‚óç\0[X¾ºpüoC›ÚWC;\'´ëC;#´“kØß»•o˜<~,9fqëÚ:±ßßÚ¿³G¯G§ƒˆˆˆˆˆˆHKQGœ¤SPGH¢b\ZDSáxÒ%>ÚØlÅ.™üIÖ’–Câü¬Åqé¶˜ìŠ×®†%ŸyDù½8CHµ`g\rv¹¾/tªN‘–Â‘—„voòÜÃY‹óˆtØ2q	qzrlŒ<`\nŠCRça~Ïz©Î5Ú]åÿ©-1·|3³–4øS_éT\"\"\"\"\"\"\"-Ü[øÿgÉãÿe+¶¶|ºìHI#^hÃ1pL×~š<~2[±EçßÊ­Oá–™\"\"\"\"\"\"\"g¹]ğJt:ˆˆˆˆˆˆˆH— ÓA¤3iÀ€æåËulöÂïğ`ÖRdG”#Q”#QD9R¤§eÊ.é8MMMO<÷ÜsvD/`áÂ…Ú¹ÛPD9RD9åH9’G§ƒH\'0xğà[Ÿyæ;¢ğØc±ÅÑÍö„r$Ê‘r$Ê‘(GÊ‘ô<:D:Å‹Ÿ5şü—›››íŒeŞ‚Øšèr»B9åH9åH”#åHz\"ÀöÛo[˜˜î}ôÑGíŒdîÜ¹7„ßáÑvÚéÏö†r$Ê‘r$Ê‘(GÊ‘ô<:D:‰Å‹8oŞ¼}öY;£X´hÑ•,ØsùòåÇÚÊ‘(GÊ‘r¤‰r¤Iï` ] Ò9L:õ©ƒ:è¶§Ÿ~z¯aÃ†5\r:ÔNéÆ‰iÎœ9ï-•JGí¼óÎ·Ú#Ê‘(GÊ‘r¤‰r¤‰N‘~ÇE]tÿxÇã?¾w¸Q>¿Æ\Zk¬şÚ1]Ç¼¹sç^6oŞ¼11í¸ãWÛ%Ê‘(G¢)G¢)GÒ{PjDº€ë®»nÓL4hĞæë®»îÃë¬³ÎúÃ†\r{}xÎÎé ì×ÌöIT3¦¸¹~„Şí²Ë.síåH”#Q”#Q”#Ñé ²Êpıõ×oV*•ö\r?ÚBk²W:ÌÒ¬e¿æ›C»ÜâBÊ‘(G¢)G¢)G\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"ÒÇùÀÑÃl^D¾\"\0\0\0\0IEND®B`‚',NULL);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','147501',60),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('135064','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹',NULL,'','2018-01-07 18:09:37.652'),('145001','new-process',NULL,'','2018-01-09 19:32:28.374');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('142501',8,'new-process','process',NULL,'2018-01-08 16:10:30.232','2018-01-09 19:32:29.885',1,'{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}','145001','142502','142503',''),('145005',4,'new-process','process',NULL,'2018-01-09 20:00:51.185','2018-01-09 20:01:00.256',1,'{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}',NULL,'145006','145007',''),('57501',31,'æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','test_audit02',NULL,'2017-11-12 08:42:12.515','2018-01-07 18:09:37.946',1,'{\"name\":\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\",\"revision\":1,\"description\":\"\"}','135064','57502','62501','');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('process:1:145004',1,'http://www.activiti.org/processdef',NULL,'process',1,'145001','new-process.bpmn20.xml','new-process.process.png',NULL,0,1,1,''),('salary:3:135067',1,'http://www.activiti.org/test','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','salary',3,'135064','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹.bpmn20.xml','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹.salary.png',NULL,1,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ç¼–å·',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'å˜åŠ¨ç”¨æˆ·',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å²—ä½',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ€§åˆ«',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å­¦å†',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è°ƒæ•´åŸå› ',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† è–ªé…¬æ¡£çº§',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† æœˆå·¥èµ„é¢',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† å¹´è–ªæ€»é¢',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† è–ªé…¬æ¡£çº§',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† æœˆå·¥èµ„é¢',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† å¹´è–ªæ€»é¢',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'æœˆå¢èµ„',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'æ‰§è¡Œæ—¶é—´',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'äººåŠ›èµ„æºéƒ¨é—¨æ„è§',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'åˆ†ç®¡é¢†å¯¼æ„è§',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'é›†å›¢ä¸»è¦é¢†å¯¼æ„è§',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='å®¡æ‰¹æµç¨‹æµ‹è¯•è¡¨';

/*Data for the table `salary` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
