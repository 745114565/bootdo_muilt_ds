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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('135065',1,'流程审批测试流程.bpmn20.xml','135064','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"salary\" name=\"流程审批测试流程\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/act/salary/form\"></startEvent>\n    <endEvent id=\"end\" name=\"结束审批\"></endEvent>\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"></userTask>\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"></exclusiveGateway>\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"></sequenceFlow>\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"></sequenceFlow>\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"admin\"></userTask>\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"></exclusiveGateway>\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"admin\"></userTask>\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"></sequenceFlow>\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"></sequenceFlow>\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"></exclusiveGateway>\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"></sequenceFlow>\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"></sequenceFlow>\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_salary\">\n    <bpmndi:BPMNPlane bpmnElement=\"salary\" id=\"BPMNPlane_salary\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"240.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"225.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"153.0\" y=\"225.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\n        <omgdi:waypoint x=\"59.9965176371898\" y=\"255.32320080051775\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"91.4000015258789\" y=\"256.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"105.0\" y=\"255.44805199630667\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\n        <omgdi:waypoint x=\"201.0\" y=\"256.4158878504673\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"241.14537444933922\" y=\"258.8546255506608\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('135066',1,'流程审批测试流程.salary.png','135064','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0p��\0\0B�IDATx�������9ǹ&�r��B���	�K�pA>�<�+�B%S���0�1s�9�aʘ`�	GJ�)�lVzXA�²x*�9��#2�F�v���oZ�3;�O��~>U��ݙ��G��������+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`�>�_\0\0\0\0�gZ޲�G\0\0\0�C���my[P�8ݿ\0\0\0:��O�|��oU�\0\0@g��\0\0\0���&�{z�9�\0\0\0І}��݈=\0\0\0���*C���\0\0�1,�����\0\0\0�Y�h}?\0\0\00�.�7��\0\0\0����F�\0\0`�/r�;y���q(����y\0\0\00��Ba���e������Oa\0\0\0�PЇk�y6�¾XЧ6��s�\0\0`5*�����^O��;�\0\0\0F���6�B�^a�jA_.�M�\0\0�ah��nV���/���#�\0\0\00���Ղ�Qa��0��9�\0\0\00��`��K#(�G��\0\0\0��2ґ�z��H\n�ra�{\0\0�N���~6�Ʈ���#\\D1�<B�R��X`�h��i��iZu�:���_3ͮv��`#���Ǿ#�\0\0��JL�t_elΩNa�z\0\0Pa%f�t�#�n[W���C)�]�\0\0�CX�Aa߬�nv�f��odJ�}�\0@=���ak6Rެ����O�\0�m\0\0�z+1��hľՂ~��}�y\nz\0\0Pa%fĈ}y*����߇�^a?��s�C\0\0�!�ČAa_�x^�@o���4�>��\0\0�Vb�Py*~�+C�M]���)�\0@=����/�G���~\0\0@=���6/�G�\0\0\0���JLF:eޔ{\0\0Pa%�\r\n�����(\0\0�����:�ޔ{\0\0Pa%��)y�����e\0\0��JL��V+ا\r��V=\0\0���Ӟ\Z�؛r\0\0�!�w`a��\0\0�X�;��_��\0\0�X�;�����_��e�u\0\0�+q�-�E���g��S���\0\0�!�w����O��iw,���n#�\0\0�+q�c9��:�\0\0P���3�ϔ4J�Z^�P\0\0���J��gQ��O��έ\0\0�X��{��O����l�!\0\0Pa%���YR������C\0\0��Jl%n���p�޹�\0\0�+q{/�E����\0\0�!�[V\0\0`��XV\0\0`��XV\0\0`�Ė\0\0`+1�\0\0��+1�\0\0��+�e\0\0���J�e\0\0���J�e\0\0���J�e\0\0���JlY\0\0���cY\0�}l�cY\0�}l�[V\0\0�}l��XV\0\0`��XV\0\0`��XV\0\0`�Ė\0\0`+1�\0\0��+1�\0\0��+�e\0\0���J�e\0\0���J�e\0\0���JlY\0\0���JlY\0�}l��X���\0\0�>6X���\0\0�>6X�-+\0\0�>6Vb,+\0\0��\rVb,+\0\0��\rVb�\n\0\0�����JlY\0�}l�cY\0�}l�cY\0�}l�[V\0\0�}l��XV\0\0`��XV\0\0`�Ė\0\0`+1�\0\0��+1�\0\0��+�eY�﫯��ȓO>��e˖e===�bYu��t��lժU��Y�\0�z��MEA�z��l˖-ٮ]���ܶnݚ�\\��ݼ�?O�\0\0P��xP1B��o��~WOO��\0�z�ă�)�\n��kyQ�[�\0\0P��xPq.�\"�-�z�\'\0\0�!��NQ��_������sK�Vm�y<�\0W�\0�+q�}�z�\r?�>���k�h�X<�W�\0�+q������}jo<�H��\0@=V�v-�_x�\r��xN��\0@=V�6-�7��ذ����z\0\0�C`%V�k�z\0\0�C`%͢>�vߨ����z\0\0�C`%nӢ~��4,��9E��\0\0�X�۴��w}���N�����z\0\0�C`%nӢ>�kO�?������z\0\0�C`%n�~��l�O�;p�}�X<�W�\0�+q�}�z�������x.^�W�\0�+q��;wfon\\���G_nXЧ���\Z�W�\0�+�^.ꛍ��W�\0�+q�����6j�(W�\0�+�^*�[Ч�(W�\0�+�^*�5E=\0\0(�+�5E=\0\0�!�+��\0\0�+��~�����%_7wH(\0\0�!P�kR�׊���^�`\0P��^�E}��W�\0�+���͋�|���f_.��\0\0���J��o�v�-�d�F��\0\0���J��o�֬��4M�4md�^.���O��>�{�ǲٳgW[|�K��O�XݱcGv�\'V[z�s�=���|0{����o޼9۸qcv�gV[����l�ʕٲe˲m۶U�7^�dɒ��__{�{��x���o�~��o���ڵk��oڴ)�:uj����^{m��oذ��x�~�u�����oH����;�s���\\p�����\'������X�ǩ����G���x�g���9�jK\0�����׿��{������U���_�u����Ɓ�x�!����	\'���ޯ��J��/����y�=���w||���E�U?/�]w�qG���}�����;�ϋ�[������[���V����~�c�9��s�~��=\n�p���+��	l�\09yE}â��OP��Y�f��{��#�<�Z�6z����������9?����GQ)O��������f���{���{ňzz����ʎ:��(�u�]��kcd>���ի�ŋ��ͩ�����W_}���7��\Z1c f��H��\r7���?��V_��k��D�[ڕG��	l�\09yE���g�s��ݣ�?������>z�i�͊�}�Fأh�i���Hz������9���QD��=������D�Ev��w�}w��SO=������������o�ꪫ��?N3�Ԧ�ǁ����.��ja�կ~��x�.x(��Q���4C!��7�Ѩ�O�Ƚ<�� G /���[HG!�G�],�����Q���6������hy<v�E\r8w?>���[�������}p���w\\�<��A�Jm@y&Az��y�m1ʟK#�q`#���;,�ԧ>U}ުNŏ�1��8���\r��~z�o��Y���z�ϊk�s��ȏ�W|�| �YQ/O`���X�-��̙S�<F�����>��^�P\\:w=������8~����gx`����n��D�R�O#�P���i�@����_���ԃ��(���x�xm�SN9�z�!$�L��X^�i>��xN~�:q�����������xԊ�4R��i�Q���x\Z��Q�����t�Au�?�>餓���q�qQ���}�\">��(���(�������(���ό�=\n�4�>�	��?qE��r���$ā�8?����+��E���S�ˣ�z@�@�@^�J<���G�A��E\Z��SO=5�s�c4>�1�Sҋ�|��>���J����9�QH�SOW�o6�>�&F�c�<���3}���_��OgP���ͫ�f!���zhu�~z��?�i��z@�@�@^�J<jE}�4���E�f͚��𣀍��EK��1�����pi:|�Y��-�b�y,����L�Ji�>�W?�3�W�V{�ڔ����_o�>M���ѧ�7\Z�����|�>�=q�x}���rK��}��z\0Ż�?~F�w��~�����#�#������9��:.��������+��n���/F�+�[̕/�W��*���4]>����T<w>���	��F3����Ǹ�^��3\rR�]����9�q0#��?묳��k���Sb�~�wM�Ⱦ��#�#�����ڣ)�99y+��^Q/O G���`%V�k�zy99y+��^S�rr�VbE��^��v	�#�P�k�zy99�+��^S��(������XQ���\'@�@�@^�J��W��� G /X����^�@�@�@^�J����������XQ���\'�]�����^�@�@�\0y�J����6\n G G /`%V�+��	�#�#���,[�L�~mG^��\'@�@�@^�J<�U�V��e��t���޿΋��	�#�#��j���g�X��Wo���v�����~�ҥ���<y�����M������u1�;������Ce��:�������0Qz�#�#���h9-�e5u��}�7�	��#��w����O��iw,����i�#�r��X�;��_˩������ G /`%��3%�ҧ����g�	��#�����YT,��h�s��	��#�����0J�Zww���C�r��Vb+q�.�%�\n�Z[�?$O G���`%���ri8J��zy9�����\\\rVл�<�r�Vb�\n������XVXF G G /`%Ʋ��@�\09y+�e�err�Vb,+,#�#�#��cYYF������ز�29��+1�����X���,#@�@�@^�J�ee�r�Vb�\n������XVXF G G /�7V�E��6i���t8XF G G /�~+씼�������?���299y��\\i�Rԯ�:u��K:,#�#�#�hϕvJ������l�!�������[���uF�u8XF G G /��+�s�K���299y������p��@�@�@^�3��OΥ��?���299y��Z�������`����@��S��:,#�#�#�&�,��}��Wy��\'�lٲ�����Z�ĝ�;/]�4[�j���m����#��-\n�իWg[�l�v�ڥ�Sۺuk�r��w��<�� G /K��+��Za������� G /KL�W`ｖ��u8XF G���0,q���z������#�ƴ������^]��칥_���<S�+�u8� G G /�qQ߷�7���볟/�f���s�sE��2���6-�7=��\n���xn��\\Q�ñ�\099y�]����fâ>�S�+�u8� G G /�iQ���ƆE}<�8W��p,#@�@�@^P�+�u8XF G Gr��h�q��FE}<�8W��p,#@�@�@^hӢ~��4,��9Ź�^�crr�B������6<~�����c��\\Q�ñ�\099y�M��h�=}���>S�+�u8� G G /�.˲�[�~�����+�ϟ��W\\�{Μ9Y�Sf͚��?��?�u�u׽��o~���I]��ܙm��wN������L�u8�t�6\n G��������G�馛v_y��������\'��z{{�;vd!>nٲ%���~��E�������?��_^|��M���o[o��;\Z�S��k��A���my[P�8]�k�\0r��ː���ܯ��;���j�����g�z��g�/~��ϛ7���?��	_��ܙ��qy��}�aA�Z�&^k�^Q?HA�\n��ߪ��Q\09��eyM��c�=���K.�-Z4�b��G?�Q6w���eԾ^Q�ltި��~�}�ǱQ\09��e`A�bŊ�.�����_�F�/���K.�~�E��D,�[�l�^��������\n���s�m@�\09yi,F裠�s�GS���_����=k���-�SS�O���Ղ݈��� G /��9�1�~�F���Ϟ={[^�=��zMQ?�U�6?��c�\0rrL���U�����s����ŋ�Ϝ9s��^S�{�=��Oao�\0r��K���U\\������v饗�թ������\\Џ��c�\0rr�2Q�(}܇>n[7~������zE��~4�(�x�6\n G G /�l������x#�u�P͝;���zx;�����M�:u_E��~�њ:o��F��H�`���?���{�\'O,x6��^�&���mʋ�oD���Wԏ��E�~\'o�>E��\\<�F����y�?��O>���?��O��C��ߟ���v��y���WԏAA?�P�?oY�c��}��S��(���5/W\\q��7�|s\\����zkK���ɂ=�P��ky�����O�����;��t�zS�/���\n�bA�����α�Q\099&c^�̙��رc\\���y1*�^���E}j[��ݼMNQ�\'�Xm�=�X�;��s�?���x����͛��7fg�yf�͞=������?[�re�lٲl۶m����/Y�d��۰aC��5k��{�)�/������}}<�������ַ�ձE}���//����{C��F�v�}�¾����z���(���-/񇍷�����`���յ-��fmd���=�����������������}\'�[�s_�Q�����������gf̘���O��y�w�c�&/܏�5k�!yA��(��?�����_�9�IQ���;����Կ��{��qd}}}�ǋE�֭[�_�u�rH��\'�pB���W^y����_lX���o��Ơ��QGU}Ϗ}�c�SO=5��C�.q���SO��㎫8���-<<�������X:(�)�����G}4;�#:����>l�ׇ����6�B�^a�jA_.�MŷQ\099&C^.���ߎ�H�������;���B�6Z~x�Q��E�I\\p��=\n���y�|��c���~�y�\'��8\0P;�,�<��W��A@�_��V�����y�_y{�AA�=�7��� �p�����(���{���?>[�hQ���:uj�����.���q\0�R��b:��T�����N:)��K��\'>O����W��]bf�O<��!^ϗJ��뮻��ky��ϋ�Q<`_�t�M�_��~ٗ���!�w�ܙ��CZn/זݗ/�o�������ύk\"̜9�����g���(�c�ucQ�3>>�ºYa?Ԃ���V���(��?/�_~���>�~���/��s�o���}Z)���Q�d��Ra��=�����?�|�Q�h��~{��;�T�����t@ �\'>nڴ�����<����~��\'Fʣ؏��x�(�>���cG}t���Ji�?>�Ǟy�=,����y���y�D�S��|<7w�����sN� �p�����Ϻ����?����2�S����y�^���?���/�9o�b�|���?���y{0ow����{/��F����3f��X��G�������O<��80U��o��nT��3̂>q�����0�r���o�����?���r����0��޽�S�GQ�\n��>�����W�^]}좋.�>F�S�|뭷V�������(�+�)�1ݽ����뭷��#��i&@�*�a��4�Q�tP�+��>��g�����~<�T4\Z�/���{��q����9�q��(֣h��=/��EQ_+���qޞ��}���k����f�ޟ�w�}?5�B�^a��\n��`�F������_��=�}��n�aq�ܧ��p�4uqQ�F�Sq{�w���u*�S�^��1�}���ف�s�1�m��V}n�ڵ{�ԧ�7D��я~�ڢ�����ϏO�}��w�N�����b�^o�A*��<��O?}�߹\\ԟ|��F��@�Yg����;���7��S���q�Ư>��O��w�w�|��揬W؏��/�α�Q\099y�������.��7����]�~ƌ���a���[�\r�����T���x�q1��:h��v�:Ή��B9��{��믿^}��^p���Ο\n�f��덦�i�q���kR�&���Q�?��{�i4~\"���v��k��ǁ�l�}��m�?.�ܗG�_�=>j��]������t�UW����g�5�>.h���O�-�c4>�1�>��^��^.�S��Ω�Ԯ�_)�S����rQ�F��h}\\�.�����������W���*�)��������xm���kQ������B>����Ǧ�9=����l�����7b��F����y���?������0Z�mƌ����d*�+�)�(���z�\rG�+����J�g�1��\"u1?��GK�y�\0��t��t���Ь��4��}��_��1J�E�\Z���Q�N�O}��j�YX���G�P@�U�����Ω�Q\099&K^�͛�>n�6������w��Zԧ��cT�R�j|q�:�.�w|W�/NmO��/�&.�W���C9�˼�X��>]`Μ9�S�n�<����N.��B�����0\n�VG�ݶ����Rػ�����0���ϝ;w��/�<&�����{ŷ0�9��zm���(ꇩ��f��ov�F�Tܧ�F���|y�5k��y�潷e˖Q-��x㍟̘1��N�v��W�C���f}e��}:�lݶ���0	�2s�̹_|q�h���}�]]]_�����^Q?D�F�[-�Zا����Q\099&s^����f�z�o��o~=���m�������r��9����W�C�ؗ��_X�}����K?�9�6\n G G������Ϙ1cټy��z�g��>�?��C�f�Z���s����Q,��+���&��u6\n G G��4��ϋ�~Μ9[�ϟ��O~��{{{ߌ+���۷��y�旖.]�?n���%3g�|5����ԫ�+��c�<?\n�ٕ�ߦ��}��6\n G G��4�����2�G<����#�)����(oW��D�(���\\؏T����(���^Q���h �F���E���o�H�̛ro�\0r���zE}�CiwQ<�#@�@^P�+���P�Лro�\0r���zE}�S�֗��%�F��#�����1�V�O���\nz�#@�@^P�+��S�{S�m@�\09yAQ�����^Ao�\0r���eٲe���v�E��I���B~���F��#�FѪU��ܲe�{/���޿΋�&ɪ6���m��� G /���˗��bŊ_�������7B�ҥK_��y:,#�#@�@^������ӳ.���9�ژ��?�0�\nz�er�����299���`����\0�p,#@�@�@^\0��ȑ��\0:,#�#�#�\0�e������29����`��������299y��XF Grr��p��@�@�\0yt8XF G G /\0:��#�#�@��er�����299y��XF������29����`����p��@�@�@^\0t8� G G /����#�@��err��ñ�\099y��XF G���\0:,#�#�#@^\0������2�����`�r��p��@�@�@^\0t8� G G /\0:���#�@��err����299y��XF����\0:,#�#�#@^\0������2����4�ˢ�`��u�S6\n G���\0�׹L�����������S6\n G���\0���,��_;u��}��l@�\09yڳ��Ҩ����>��F��#���;�z�֯3Jo�\0r�����̀s�Ko�\0r���!�\"~�Qz�#@�@^��,�?Q8�~����� G /@gu6�s���(�r�t^g3E�c�\0r��L:Y���ꫯ>��O�fٲeYOO�6�m�ҥ٪U��>o�l�H�#9�#9�#9�#yZ��ի�-[�d�v���Rۺuk�r��w�\r�yv��H�#9�>ˑɑ�В8���o�\r������Dɑ&Gr�ɑɑ�В����m��w���Dɑ&Gr�ɑɑ�В8�G��V����8\'�FA��H��H��H����#E=L���׿z3{u���~����xL���Q�#9�#9�#9�#MQ�q�߷�7���볟/�f���s:m���(9�#9�#9�#9��@�v�����jo<�H���%Gr$Gr$Gr$G��h����\'�ٰ��t�:;Qr$Gr$Gr$Gr�)�6��7��ذ��t�:;Qr$Gr$Gr$Gr�)�����N�ir$Gr$Gr$Gr$/�hv�qU�F�<����ۉ�#9�#9�#9�#MQ�i�q�w\Zv��N[�o\'J��H��H��H�4E=Ц��;��\r��0p�V�X<����ۉ�#9�#9�#9�#MQ�i������c:l����ɑɑɑi�z��;��;��?���)Z�c�N[�o\'J��H��H��H�4E=І�߶���5w4<�*����u�v��H��H��H��H����X�h�֩��S:��;�77.�~�/7��S���kݵe\'J��H��H��H���-��m�`E}WW�tt@���(���:;Qr$Gr$Gr$Gr�M���X2HQ�v�ԩ����:�V��vtW\'n\'�N�ɑɑɑ�QG�S\Z����g���C:��v�����D�1��5M��H��H��H��H�ں��wn�:���A����e��m[��>N�#M��H��H��H�ڶ�pn�s�A�Mޝ��J;N12�u��Hɑɑɑɑ6�r���҃�_�uZ����&��ɑɑɑi���D�\\�	y�\n(�5���5�QJ�O�#M��H��H��H��O:��(=���ɷ��҄!�#9�#9�#9�#��s4s�̏wuu]���mc�ޫ�����k�)�W��TQ���&�N�iC����H�#9��H��H�FQܪ.o=y�5�=������TS���&�N�pG:���:yGJ��H��H��H��N�Q^���?\ZB!_��>���TU��_�����N]�詏r$Gr$Gr$Gr�uR����>;cƌ�S,�gΜ�}��Ȗ/_�����]���Yx������l͚5ق��}�s�¾Ϩ=����މjv��~9�#9�#M��H�������X�?��ٖ-[�Vl۶�����bq���E�+����;o\'j��\Zܑ#$r$Gr$Gr$Gr�uB�b��X�_u�U�Q����kʅ�{����;h�)_T�w�va��P����.V$Gr$Gr$Gr$GZ��(Ρ/N������WLͿ���S�Ve��_��9;P�;B��[V���T���)9�#9�#9�#9��=GyA��8B?҂�XؗF�W��@����Jmd#+�Vv��;P��.<�1�4ʑɑɑɑ��9���ϡ�����ϱ7\rt�:���hǦ��`;R�^O��w�9�r$Gr$Gr$Gr��yQߓ\n���Xx衇��C\'t���[�vm��/V?߼ys��=���ٹ�[m�g��{��s���Ν[�|�����̘1�����#�̎=�؆Ͽ��k��|ꩧ�S�����̮���������\'�x������ߑZ��{�w��}�-��љ������?�mذa�w�ѩ��G�5m;F�v�Z݁*�H����V�Wr$Gr4�9�:��#9���Y7fΜ��tq�M�wƤ����nww�jڬ�Oȧ>�����.����A��z���=�����:k�����>�M�:��y___�b��SOm�w��G?��r�)��&\n��+Wf�?�x�hѢj���3�do��V��_�~��x����(N�(X���_}������ᦛn�>���W��h�`��������Ӣz���>�ⷵ�#�lGj�;Pş�u�GHZ�_ɑ����H�ňɑ�Ϻ�?~Yz]4Kq�BQ�jڬ�O�4��_p����رc�bdɒ%٬Y��-^#z�vX�կ~���߬9���>;�Q�D���o���#�8��w{�G�x�5k�T������EU�GuT�he�_y��ǭ[���4�������>P}�������*~F�:���36n�X}.=�.��-ir�w�S�H�3����̸�H����#9���͑6��9�#9\Z�u#����+ƴ��mu�wY�ڂ6*꣸���1��8�6����(ʯ�Ƙ�_��x���4a��&��������Oy�.����w�}�Z���_}��Ϗ;�j����x,��FQ�M���\'�pB�o?�C�3�8c@S����L�H|ܴiS�v��Gx�� ��z;R/�`j��Ϙ���H��h�r�M�bD��H��`�ȿޘ������M�-h��>v��x���TL����kT��\r_w�u���جISscD�Xp4�,#�{�hf�:�����#���H���~������/��~�^zia�\n�(��b��i�3��c�����C�P�裏V��G]}~ٲe�\Z�[�_<�[��5ґ�z;R#ف*�HMk���ɑ�O���Q�ȑ���y۞����\rv{���ޡڂ6\Z��;�1�w�W֝6��+Fb�<Ε�)�Q\04+F*���\Z�E�Q�M�M�E���O~r������ş�����F	�4��c�؊��(<N?���i�iT2�=N��l�p��|�3igg�W�}ꌈ�T{|$���*�ɑ�o���or$G���Q�����SmA��1�;�q���:v|Snc��rūX��aӹ�qѭ��#�����4e8]\r;>�?~���٫7��Q1ϟ|�������_�����)��J_�EF�#�1�\\x�&�|V��_uں����S�Nݷ��fW��H+�\rn瑑=�Wr$Gr4>9\Z�;HĬ����������X_����SV��9��3�9s�j�?�[��V����=�y\\l2��i%;r4�rTo�q�\'V[�Ev��>�`uJ��~>��hi����q\0:fVŕ����������m���ϋ��3�b�[�xjq���z�L�~I�_��l�_��Ll���5q��,�J�:2:R߿n����I^�G\'_���AL��sa��E�)�i�?v����j�W��)�>��j\Z��xL.>�Ot0�G�)~�I\'�TݐD���GQ�*�q����R�S����ة��W|���Ϸc�_�y*��U�����H��s����H��h|r4�w�H�0)l������#[�FE�t��CD�(eF������?��w�H���8ȗ\n��]\\ܲ��ĵ;��)���%ڼ��q�Q��q�t�+��*�;q���t9���|��U)�vU.���h�fJ��QT�3Y<�2��h���n����\Z\ZO۰J锸��]s�zP�����}��b�Q�x,��N>Z�F�UW��D1p�%�����c��s�Q��	K�;>qt�8\Z�؁�ׯ^�������x���v��|�ш���1�\rOq�$���\rFq#?�|e�6���vww��`�i$#�nT�j�CّڛW�%Gr$G㗣��A\":E����4�_G���E�~���c���]ƈ~z]�<�����CmXP�E�STҁ�4(�%)��;U��7���ɽ=j4�x�J��?�Zp�A�tP,Z�-f2��4���6-+��w�uW��v�3�S|mLK�۠b^�\0o�o��R�p�iV\\*���+�\n�bN��4;����놫߃���#;3ŝ���U��k�V��^���H��,��DA�A���tA�x}��ظ���qMG��;^���b\"6 iJr�^��89v�oO��NH�Zwq�q��ϴ1j�������H4��o��72��w����J��H��\'G�q��I�}����tp-ו�T�(����Ay}NEB�0s%�6���<��-�H��A���1�FA#���(�\"�r4�s�l��8�ۣt��QA�E_�bۖ�>�x�T�G�r���f��k��pdK�Ô��x�w�����|P�R:%f���3g\"k� F|L��:`����>����&�URG���D���0w�Ҕ˳�H��ɛ��D�E}:Q�Gq��Q��k����\"�q��X@D�Ӊ��^i0R_o1(�=����O#����Թn���>�u4ֹX�� nǕ�i.ŃU�\0p�*��O#�q�R��i�֪�A*��ݝ���8(�n�Z�.x�	1�&Nũw����r����⁶t�.e�݋�V̜9��y��;\n����\Z�/Κ5뷅��p�(F#��I�;PCݑJ?�l9��H���iFK���+^0+~fy�o<{\0Q|�Q�4u?��^�b��\0���x>N9)\"��L�����#������w@��Ω�����s�+�Q�T�������9���hz\\+&No�[��v�m��*���4*�\n�z�x3�fD�YIw�\"��@�L��3\\o�J����t�\\�N0�Gq��Tl��l,<��C�Q��*-���H�v��b�7cƌj��*cG����@����htf�W\n����{��M�D�����+C��o���C���9J�xi\'�|���5�)���+^\\,vvb\'+��hŝ�T�s�czozM�׵c��hb�h�� #�i�q<�ާ;:����Q��b��_ir����/���s,O�o����+@�Q�z�J�~E�l�b�O�Z���z�p\\��х�b�z|O��{���Tҹ���HL�O�b|���/ogʣ��3c��h���x�ޝ]b�|l+��b&Md%�o��8N	��)H���A��\\��\r���S����}��x�|_��>�y�TZ0A��t%߸�O��I�\'I�$�wԵ\\���q?�F�?�+�m���H�M�4���U[�{��L��C��T�����m��)Gi�_�i���1-29iD�x����bG(\n���O��NO�u�{�ǈf��[�g��N�&f���1��vW\\qE���(�8����ωb������Ɍ�����G;]����G�s������V��XB��<ˑ�Q:8����V��//*�i�L��W\n�2M��G�ҀMqm6�>�&��K<�烝R���⁼�x�/]�\"NyI��+��_)\\,�xM�N������k����b?�_����Q�!^+褢>:�b��vV*��\\�s��bϥ���jԁ�z��t���\ZjU���p�\rE+��E}qGgza�hve�*�H�Gܱ9��f�����9����Q�&F-�z_od��sEv�PE�饗�=��Z���_A��)�t�[��hb�h�� �f�Ķ&���Z~9wł#�D��E�\\�G}�\0[i=D���+~o�[D��z�ה�t��4ʙ�C���jO�l���X��H�q��|G��F�c��.�Z|�⁷��G.RXo�>e&�Ғ�z�{:�|��hq�K0N�Ҕ��~�p!��=��#\'Ń��uhQx޶��{��#-�c���o.�G����}�*&pQ_��v���:����;\Z�6�څK;h0�+����J튧is�Gg\'A1RoGj4F\\����퐣F����/�S�t���L젧�o�����ئ���E��͛W},]���������D��v|���[��hb�h�� Q�U]�H�Iwqh4����[}�P���7TJ�+^�O��h��f��\"8�b�8#�R:M�R�\ri�._�O��Ν��N�7K��9��H��#~v�v�<�->ƶ)����S�ENb;Z���}�H�NÙ9����l�h^\Z��T�����i�0ы�4�S�b�T�l�HQ���a��#=����H�N�x�U|�n�����J�����.�cT\'E��ѭ�����!�ź#��\n�:�1�P�����H}.�LD�҈|�1�R�ΟF4*��k�m{�;A��>�{ŕ������5)� h�����̑f{$Gr$G�ɋ�9��>α�Yq`�ի��E���G������\n&A�#-Q��ŀb�?�妫���@���JmJdL�jv�m�ŋ\nEK����P7�Hs��4v�Z\Z��Ŏ��8Z9�\"�x._q�a*~��,��#��O�tid#�(��4�(�S�fɤ�>��X���O�)���Wj�\"N��*�w�]r\'G�/G��ɑ\rM���m[�(��>N\\�bEu>M͏mtooou_�/��/�/��7��)�q�@e���O���TP��oU�\\(�R���H��x,�KS��T�(�������D5�\Z��FG]�h�s�ܵ�^���}��7:�1�Q�b��q�\0Y���.T<�>��ѹ�ũ��;9�#��H�49j.α/��n�m�s�a�u������:�>\n�(f*���E}��Q�8��J��s�x�vEb�0�KS���by�U�!�>F���9J�vZ����JmD�Q!�F��hz�~�����h�u:�7](������t��|[�J�\n����;9�=�l��H��!��Պ��C)�ct�U�av�i�1��U\nȋ��(j\Z/q.o���}���+�����]T���B�53f�أ�JW���<�L����HM�[_�Ζ��?�%�J�F�����R�W\Z�/]1<]�7��Gv\"[�\0[�������P\ZAotU�vʝ�i�Gr����͜9��yqe^�?����V���My[���c�_:��;���o�R~<F0ˣ��).�����~Fe/�7Av�´�ҴA��:v�F#GQ����T��T��%\\��U�+��ջ�c���(~\\�\"��t`-�x�F��I��ne}o�N�l�4�#9��P�k:��!�S�H��H��H��HS�:m�w���	�%Gr$Gr$Gr$G����k��O;N&��ɑɑɑi�z@�M��?�Y�*|� 9�#9�#9�#9����k�����ir$Gr$Gr$Gr����#G�ɑ&Gȑ��u�ȑ!G�ɑ&G��_��ˑ&Gȑ!G�:�?r�ɑir����_��r�ɑir��5�?r$Gȑ!G�:M�/G�!Gr����_�ir$G�!Gr��5�?r$Gȑ&Gr�����t�r��r$Gȑ�����#G�ɑ&Gȑ��u�ȑ!G�ɑ&G��_��#Gr��r�����t�r��r$Gȑ��u�ȑ&Gr�ɑY��l�-[��m��#��w[+�H�#9��9�#���Z���-[��x۠����u���`��#M��H�#�H�\0Z�|��V�X��~{�x�ɍ��ҥ���<k�ir$G�i9B���ey�3���g]L�s�qo�A�/G�ɑ�r$G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00��/E��>K�\0\0\0\0IEND�B`�',1),('142502',3,'source',NULL,'{\"resourceId\":\"142501\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\"}],\"bounds\":{\"lowerRight\":{\"x\":116,\"y\":99},\"upperLeft\":{\"x\":86,\"y\":69}},\"dockers\":[]},{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\"}],\"bounds\":{\"lowerRight\":{\"x\":261,\"y\":124},\"upperLeft\":{\"x\":161,\"y\":44}},\"dockers\":[]},{\"resourceId\":\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"}],\"bounds\":{\"lowerRight\":{\"x\":160.15625,\"y\":84},\"upperLeft\":{\"x\":116.609375,\"y\":84}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"}},{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":334,\"y\":98},\"upperLeft\":{\"x\":306,\"y\":70}},\"dockers\":[]},{\"resourceId\":\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\",\"properties\":{\"overrideid\":\"\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"}],\"bounds\":{\"lowerRight\":{\"x\":305.375,\"y\":84},\"upperLeft\":{\"x\":261.390625,\"y\":84}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('142503',2,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0�\0\0\0?�M\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0�IDATx���\rP�g~��v�_�c�p�D�a�\Z��x�I����DsMft\n�h/�$4��It\ZcƤ^�L�֤ɵ��%��\'�E41*�9�p����&�R��Uy�=���~p�<������ϲ�����=ϳ���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��EPE�\'�ԩS?ill̾r��ئ��h��M��6�#\"<v����f;��Ҳ*--�7�\n	\0���Cuu��.�kPrr����3C�5���N/i��j���������MsssvFF���!\0Au�̙\'O>v�w��Çk��B���JSQQ�,#�y>��6Jd`�P��_��ƍg���h�@GV			Q.\\����]���w�R!\0��>�]��lll�����q~��8��f�O��\\�|��3V{,��K6�M����tΚ?����������*�N?��9����?{��Lc�1�n�j<�Vs��9sh�q՟�\0�����ͨQ�����	\0d��\'�����w�����jS��5T�*�\0�Ȉ#�V�={��5�A\0B�z�j�����o�����ΰaÜr3�� \0���u�gw<m-ݿ�ù})11�/�&����MO���(>�?|Wn�(	F\0@@��I��\"\r·�:�$\0 4D�|��!���@@�J��>c�\r���%*�$�L��\0\0�Ր�qfp��.:l<�\0��Z�;=���\n  \\]m��=���7���t�ܜ����\0  ��U���wߟ�\\�=m*�g.��o<�\0��{!${�������n	��o�Q°��e��K�0@��=��6�2\Z�������\0�_i��V�N�\0z�) �����\0\0@\0\0�\0\0\0$\0\0�-�C� �kᖕ����#G~TUU5���rP}}���r���:thKBB¹�������-]���ܚ���hmm}<\"\"b�ܝ$G�C�p��x<*����b)X�n�H\0�[���\'�����;�ҥK�q�ƙ��ts��i�Mtt��$���`;{��h��1����?z��455�����)E�g�͛���<�v��Io��)�r��������-++�X�Y�~}>	\0}���O��������٥���\'\Z�qt����HJJ2��{�Y�paDii�Ȃ��_���,�����M����&��/�Õq/O�ץ�{�HBx\"\\c��^�u���Ek׮}`����G��MrXv�ޝ�q���?��3��h\0�,333+22�]��_�����]w�e�N�jRRRL||�^S�ImjkkMEE�9x�Ѷii�v�4y�E<��@�\Z�}���߻w��/^lƌӫ����0���1+W���SO=e_�z�/(e�Z���4����[:\Z~�p͜9�;��ޠA�������}���M;v�0;w�4��ק��X�@�$���p�\n(\0��e˖���+�n�;�9Ҽ��k1R�WJ�̦��k=�Bi����6�o��~\0�e�����u���OG�p�5��霿�$X�hQ�+`O������C����C*f*���L�����nG�?v�X�bŊ?i�o��N_?a��$�^8�\Z	��t�OQQ�{:��W=��F��K��CJ����9��/Y��;��:5�����&����?���p�.��9{�5kVL\\\\�h��0P�ROi��_뜿6ڽm�}����}m��K��\0���w8�K=������rrr�#=��4�^����΢�]�����N�tG���G���p(w�O��.Xu�f �}��6��>Z�A\n\n*���L��v�m���#\"\"ֵ���lڴ������C���M��������uH�����M\0������?��c�hZ�b����ݝ��/&Lp~��s��U��������%��%�k�G�]�T�v�Z�=0X��|�C�%vꥑ�&�}�:Ծ��7�4��lz��AzR��X�CA�5@�ӽ}t{�@�:uj�T��P)% �%�ʗ].W��yl���g���\\�=+��G���C�Q�o������5e���B��>	 $b��tc7]�Hw�y� ��&W�&F�K �X��u�vIЮed���ѡ�:�#�\"ݫG��I>1��_bԨQ�w\'��B%����C�@jiiI� i��X�E\'G������iff手/RaBDuu�w+��C:2�+uh��!�����c��O$�KZ1u3�@:p�����/��������2g�*M��/��+ӟ��Y��WK?��KB}G%$\0tI����9�I`ʔ)՛7o��F��\0��=i,���ڮK\0\'\'O�|\'5&4������Ӛ~\Z�u�Mz���N�or���$�����$�����H\0�z�\Z�R[[kKNN�ό����`pt�����]�6k`��d�h��~��߫KE%I���\0�|�I5&4$&&zW�,]�4$�Niʍ�}��v�C��*����u#7&\0}�$\0t)>>����R�\0���Nh/)���ێ�c�1\Z���cCLL�^i�k�!�3�Ŷ��c��W]�!IG;�ɓ\'��$0_�e���$\0t7��p8Rt��@ٿ�����O�������}pl7S�dD�O������?}�t��b��>����&�I]]�2x���-2@\'�����u����7��\\n�###?j_�IO~�CV��P�������RSSS㗓�t��СC���iON$\0t���{b��ŧ�B~O�T����h����S�_�X���6��G��^�}޼yŒ<f�\\�B.��_۵k��u������m H\0�,���8q��ϣ�ڏ>��$��\n��)���A�CzU���&�iӦ��ggϞ5�~��޿�گ¡��\rԏ֬Y���������j�*��7UUUP��֯__(7�����~�m�о�K?�y�6��k��p�5��G�u�����r��YY��C�͖��챃�	Ӿ4���Ҽ�曽N��K2�;w�c�N�F��ж��իOKe���[H���ʕ+\'I��g��/���k�g�|�m��;潤�N��\n}ݫ���&�����N�<N�F����u�����/_��W#����⋷�p�=����2`̆\rtj��$�#�e˖��ן��-}�$��K/���u�Ҳp�5U&0��>���r���d��bi3f�-2��o�[o�U }�T��r����l.\\�\"�;��{��������;���Ǐמ���.������U<\'N�Е<��th���v�4���%F�2���?t��W��D�[��9�k�cP�{\'YYY6nܸf�Ν�srrb�瞘�ܵgϞ¼����)R�`��q�I�|��C�1�pXw:��&fFJt�?\\c�`�k� �s�U����lRSS/���\r=z�-!!!Y7�knn>/CѺ����\\F\r����R�G�k�t:����Q�=��&�x�$���h�J�X�F^�Գ7��LKKK�=z�o��d������յ��-ǳ�p�	�Xs��z��XKn�5�9]=�{����J��\0�L�b����\0�Z��\n\0H\0\0\0\0\0�\0\0 \0\0H\0\0\0\0\0�\0\0 \0\0H\0\0\0\0\0�\0\0 \0\0H\0\0\0\0N%�����n\n\"���i��.H\0��EGG_hhh� B��˗����\0�_TTTI]]�Ng��S$\0  \\.׿VUU�x<\n#�*jjj&����\0Ĵi�J�����J\n#���?T>��C(\r\0�Q@vEEŕ��z\n#jkk�I���n��Jc�P����,8x�ҥ�����v;��ƿ��lBDD�?Μ9��!\0���w2;;�w�ϟ\\\Z�������`����pl��׃��Ϙ1�3�d`!�rv�ޝ\Z���j�\'))����ߕQA�<F�����ץ���G?��9�����pP:$\0 dM����2]��rDS*��\'y�:�b9���/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�i�V1�W�Q\0\0\0\0IEND�B`�',NULL),('145002',1,'new-process.bpmn20.xml','145001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"process\" isExecutable=\"true\">\n    <startEvent id=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\"></startEvent>\n    <userTask id=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"></userTask>\n    <sequenceFlow id=\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\" sourceRef=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\" targetRef=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\"></sequenceFlow>\n    <endEvent id=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"></endEvent>\n    <sequenceFlow id=\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\" sourceRef=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\" targetRef=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">\n    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\" id=\"BPMNShape_sid-450D3E1C-0BC3-46D1-9A34-B5B1E25358E2\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"86.0\" y=\"69.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\" id=\"BPMNShape_sid-1E824AD2-3B5E-46E0-9DBF-8AC0C77ED5E1\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"161.0\" y=\"44.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-6671953E-684E-41C2-8C80-8BEAD9289719\" id=\"BPMNShape_sid-6671953E-684E-41C2-8C80-8BEAD9289719\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"306.0\" y=\"70.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BA3E24A9-4796-4754-BC74-659051F2504D\" id=\"BPMNEdge_sid-BA3E24A9-4796-4754-BC74-659051F2504D\">\n        <omgdi:waypoint x=\"261.0\" y=\"84.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"84.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-01195158-26A2-436D-A9A9-B148E4CA82F9\" id=\"BPMNEdge_sid-01195158-26A2-436D-A9A9-B148E4CA82F9\">\n        <omgdi:waypoint x=\"116.0\" y=\"84.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"161.0\" y=\"84.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('145003',1,'new-process.process.png','145001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0\0�\0\0\0�/��\0\0�IDATx����OSg�q/���؅ɖ�?a��0�.$ �$V(�$dJ �4��-YLH���%� cL^\n�Wɘ��6D�2��+ȳ��Qs,������~?�7�b�9�>}z^�m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�B)�}ll�fOO�ۖ����̰x��n������l���H\\;::���U~���133����^���e�Bf���6����0[%��,@��3t`��*��5@�f��*�J �����\Z뽦�ܥ�!�-_#�@����T\Z��@}�{C�&�F ��>�yM\\�cb��0X\0�v�n�����#�f`4�lXy�0X\0���W`威�+�F ���v}�a`�1�H`����A���x����<F	,�0+���7�V�F	,�H���\Z��a����<F	,�0+gj�t}��\Z�<��\\�V�g�S��ꏆo7�kp����2�%�\0>؏�Z��X\0av3���f	%��A`ÍkpJ`�&�\0,�@`\0�%��9�R;]ׯ_o+++{q�ر���L�������W�9�?}��Xyyy��X�\r_ZZ�\'���9z���Ǩ�鱨�C�X����|u��޺u��ٳg�����իWUOO����T���Jȯ^�Wݿ_�\0��Ǐ��8qb�СC��A`7o߾}_�Ѭ�5��w���S�8�C�u�ܹ��x.//�����W����.�k8))�3� �ӑܩ#ٰ���7:���9yֺ�������ê��nKa\r��Р���|N��Xm��~Jjj��X������U=~�X�|�2�?-,,�=vuu���\n������3��y\\=�o���jddDE����ұ�eggC`�����A\\6����*��sss���g��3���\r��U��\'x���ӳظu%�6�3Wc\\�����p����2��ۚ�,Dk��L���s���E`�XYs5.�[�,�?>t�`e�������R�������ާ���#��D����8s�4��Ȇ�d;��\r����(Ơ7o�َ=:�o_,����e\\s\rwY�C��5Y�\nl0{��\\�P,+��uK`	l���|@e���jf�v!gh�[���UYYYӲe��^�/	,�5s�3��l�,svv֔�K�.9�k\'��9����RY����_N��ч��S����_Xk�6�z�k��.^�h�>f�)J#rm9��J�����I����aw֛�X�6�zm������}LNF0�]�(]�ȅ[���,\r����W?�Ol�s���wK`#نV/��z�?�\n%g|�O(]��U��n���<�2��w�lD��X�6��/���:4�C�l~�\"���^�\"&���k��6V�c�.F222V����|��8������w���3�H�!�u]��&���\\��k�O�>���k�5X�m�5�TTT4j�Q������(�{r�MhX	,���6�Q	�ҥK�V[\\\\\\o��`ם�X�m��`Й3g>���yk�\\�������%��FB������grɽ�8��&������Z���U�z~4�%���Z	����I\'O�\\�`;�g�}\\M��մ̻����V���͸\\�A��+�����N�p���u=X=QZ6�^�u_sY���uG����Z�3��������cƄ;\Z�pGKOOO�3مhߓkbb�S�my�=��rO��^Ѹ\'W�̕��JKK˒Fk&+3W��ޠ\n��߆��(�d3��\r�UV�����q�U��5G�WW=�}q���W|�5w���k�, ��],�5c_�c�H	�\'+\'#��4�| �\0r���Dp������6��y��k	�&�_[\\.�t__�o+ǹ655U�@��\"��ց,�5k_3���`�5>������LoYY�Pgg�#�*:�@�\\�E�-�v�)))��_}��ɖWR�}�I`	����jh��V\'�k��6+��[=���\\�\'x������,��9��K`��\0K`X�@`	,\0K`X�@`	,\0K`X�@`	,\0K`X�@`	,\0K`X�@`	,\0K`X�@`	,\0K`X�@`	,\0+���6��E�%�J�!��ۧ�^/q������Iv��p���֯<��gϞ��\\�f�W���H��l����z��9���SYdX>��}��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��?�#�\r\0\0\0\0IEND�B`�',1),('145006',2,'source',NULL,'{\"resourceId\":\"145005\",\"properties\":{\"process_id\":\"process\",\"name\":\"\",\"documentation\":\"\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('145007',1,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\02\0\0\02\0\0\0?��\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0\0 IDATx���\0\0\0� ��nH@\0\0\0\0\0\0\0\0��\'B\0����\0\0\0\0IEND�B`�',NULL),('57502',8,'source',NULL,'{\"resourceId\":\"57501\",\"properties\":{\"process_id\":\"salary\",\"name\":\"流程审批测试流程\",\"documentation\":\"\",\"process_author\":\"bootdo\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/test\",\"executionlisteners\":\"{\\\"executionListeners\\\":\\\"[]\\\"}\",\"eventlisteners\":\"{\\\"eventListeners\\\":\\\"[]\\\"}\",\"signaldefinitions\":\"\\\"[]\\\"\",\"messagedefinitions\":\"\\\"[]\\\"\",\"messages\":[]},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"start\",\"properties\":{\"overrideid\":\"start\",\"name\":\"启动审批\",\"documentation\":\"\",\"executionlisteners\":\"\",\"initiator\":\"apply\",\"formkeydefinition\":\"/act/salary/form\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\"}],\"bounds\":{\"lowerRight\":{\"x\":60,\"y\":270},\"upperLeft\":{\"x\":30,\"y\":240}},\"dockers\":[]},{\"resourceId\":\"end\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束审批\",\"documentation\":\"\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":1003,\"y\":384},\"upperLeft\":{\"x\":975,\"y\":356}},\"dockers\":[]},{\"resourceId\":\"modify\",\"properties\":{\"overrideid\":\"modify\",\"name\":\"员工薪酬档级修改\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${apply}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\"}],\"bounds\":{\"lowerRight\":{\"x\":311,\"y\":193},\"upperLeft\":{\"x\":209,\"y\":135}},\"dockers\":[]},{\"resourceId\":\"audit\",\"properties\":{\"overrideid\":\"audit\",\"name\":\"薪酬主管初审\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\"}],\"bounds\":{\"lowerRight\":{\"x\":201,\"y\":282},\"upperLeft\":{\"x\":105,\"y\":225}},\"dockers\":[]},{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\",\"properties\":{\"overrideid\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\"},{\"resourceId\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":280},\"upperLeft\":{\"x\":240,\"y\":240}},\"dockers\":[]},{\"resourceId\":\"audit2\",\"properties\":{\"overrideid\":\"audit2\",\"name\":\"集团人力资源部部长审核\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\"}],\"bounds\":{\"lowerRight\":{\"x\":310,\"y\":410},\"upperLeft\":{\"x\":210,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\",\"properties\":{\"overrideid\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\"},{\"resourceId\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\"}],\"bounds\":{\"lowerRight\":{\"x\":385,\"y\":390},\"upperLeft\":{\"x\":345,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\",\"properties\":{\"overrideid\":\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"}],\"bounds\":{\"lowerRight\":{\"x\":345.1328125,\"y\":370},\"upperLeft\":{\"x\":310.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"}},{\"resourceId\":\"audit3\",\"properties\":{\"overrideid\":\"audit3\",\"name\":\"集团人力资源部分管领导审核\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\"}],\"bounds\":{\"lowerRight\":{\"x\":520,\"y\":410},\"upperLeft\":{\"x\":420,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\",\"properties\":{\"overrideid\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\"},{\"resourceId\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\"}],\"bounds\":{\"lowerRight\":{\"x\":595,\"y\":390},\"upperLeft\":{\"x\":555,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\",\"properties\":{\"overrideid\":\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"}],\"bounds\":{\"lowerRight\":{\"x\":555.1328125,\"y\":370},\"upperLeft\":{\"x\":520.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"}},{\"resourceId\":\"audit4\",\"properties\":{\"overrideid\":\"audit4\",\"name\":\"集团总经理审批\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\"}],\"bounds\":{\"lowerRight\":{\"x\":730,\"y\":410},\"upperLeft\":{\"x\":630,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\",\"properties\":{\"overrideid\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\"},{\"resourceId\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\"}],\"bounds\":{\"lowerRight\":{\"x\":805,\"y\":390},\"upperLeft\":{\"x\":765,\"y\":350}},\"dockers\":[]},{\"resourceId\":\"apply_end\",\"properties\":{\"overrideid\":\"apply_end\",\"name\":\"薪酬档级兑现\",\"documentation\":\"\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]},\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"admin\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\"}],\"bounds\":{\"lowerRight\":{\"x\":940,\"y\":410},\"upperLeft\":{\"x\":840,\"y\":330}},\"dockers\":[]},{\"resourceId\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\",\"properties\":{\"overrideid\":\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"}],\"bounds\":{\"lowerRight\":{\"x\":765.1328125,\"y\":370},\"upperLeft\":{\"x\":730.21875,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"}},{\"resourceId\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\",\"properties\":{\"overrideid\":\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"}],\"bounds\":{\"lowerRight\":{\"x\":241.44715254815893,\"y\":258.8729578650751},\"upperLeft\":{\"x\":201.64659745184107,\"y\":256.4551671349249}},\"dockers\":[{\"x\":48,\"y\":28.5},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"}},{\"resourceId\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\",\"properties\":{\"overrideid\":\"sid-7D723190-1432-411D-A4A4-774225E54CD9\",\"name\":\"是\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"apply_end\"}],\"bounds\":{\"lowerRight\":{\"x\":839.78125,\"y\":370},\"upperLeft\":{\"x\":804.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"apply_end\"}},{\"resourceId\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\",\"properties\":{\"overrideid\":\"sid-D44CAD43-0271-4920-A524-9B8533E52550\",\"name\":\"是\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit4\"}],\"bounds\":{\"lowerRight\":{\"x\":629.78125,\"y\":370},\"upperLeft\":{\"x\":594.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit4\"}},{\"resourceId\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\",\"properties\":{\"overrideid\":\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\",\"name\":\"否\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":239.5},\"upperLeft\":{\"x\":260,\"y\":193.5}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\",\"properties\":{\"overrideid\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\",\"name\":\"\",\"documentation\":\"\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"sequencefloworder\":\"\"},\"stencil\":{\"id\":\"ExclusiveGateway\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\"},{\"resourceId\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\"}],\"bounds\":{\"lowerRight\":{\"x\":280,\"y\":85},\"upperLeft\":{\"x\":240,\"y\":45}},\"dockers\":[]},{\"resourceId\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\",\"properties\":{\"overrideid\":\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":134.3828125},\"upperLeft\":{\"x\":260,\"y\":84.5625}},\"dockers\":[{\"x\":51,\"y\":29},{\"x\":20,\"y\":20}],\"target\":{\"resourceId\":\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"}},{\"resourceId\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\",\"properties\":{\"overrideid\":\"sid-72258A41-203E-428C-B71D-CA3506252D73\",\"name\":\"是\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit2\"}],\"bounds\":{\"lowerRight\":{\"x\":260,\"y\":329.46875},\"upperLeft\":{\"x\":260,\"y\":279.90625}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit2\"}},{\"resourceId\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\",\"properties\":{\"overrideid\":\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\",\"name\":\"重新申请\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit\"}],\"bounds\":{\"lowerRight\":{\"x\":239.7734375,\"y\":224.51953125},\"upperLeft\":{\"x\":153,\"y\":65}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":153,\"y\":65},{\"x\":48,\"y\":28.5}],\"target\":{\"resourceId\":\"audit\"}},{\"resourceId\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\",\"properties\":{\"overrideid\":\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\",\"name\":\"是\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==1}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit3\"}],\"bounds\":{\"lowerRight\":{\"x\":419.78125,\"y\":370},\"upperLeft\":{\"x\":384.8671875,\"y\":370}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"audit3\"}},{\"resourceId\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\",\"properties\":{\"overrideid\":\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\",\"name\":\"否\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":365,\"y\":349.6875},\"upperLeft\":{\"x\":311.859375,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":365,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\",\"properties\":{\"overrideid\":\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\",\"name\":\"否\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":575,\"y\":349.6875},\"upperLeft\":{\"x\":311.44921875,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":575,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\",\"properties\":{\"overrideid\":\"sid-35CC8C6C-1067-4398-991C-CCF955115965\",\"name\":\"否\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"modify\"}],\"bounds\":{\"lowerRight\":{\"x\":785,\"y\":349.6875},\"upperLeft\":{\"x\":311.244140625,\"y\":164}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":785,\"y\":164},{\"x\":51,\"y\":29}],\"target\":{\"resourceId\":\"modify\"}},{\"resourceId\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\",\"properties\":{\"overrideid\":\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":974.078125,\"y\":370},\"upperLeft\":{\"x\":940.5,\"y\":370}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\",\"properties\":{\"overrideid\":\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\",\"name\":\"销毁\",\"documentation\":\"\",\"conditionsequenceflow\":\"${pass==0}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"end\"}],\"bounds\":{\"lowerRight\":{\"x\":989,\"y\":355.89453125},\"upperLeft\":{\"x\":280.2216796875,\"y\":65}},\"dockers\":[{\"x\":20,\"y\":20},{\"x\":989,\"y\":65},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"end\"}},{\"resourceId\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\",\"properties\":{\"overrideid\":\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\",\"name\":\"\",\"documentation\":\"\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"audit\"}],\"bounds\":{\"lowerRight\":{\"x\":104.83832369973481,\"y\":256},\"upperLeft\":{\"x\":60.49976831931648,\"y\":255.3340467200345}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":91.4000015258789,\"y\":256},{\"x\":48,\"y\":28.5}],\"target\":{\"resourceId\":\"audit\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('62501',3,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0�\0\0\0�_г\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0��\0\0u0\0\0�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0 \0IDATx���	xT����3�� ���QYT\\��b���EE �Vjk�����XA�A��Ek�*�*P!D ABB6�����ͽ�fHB���~=���rg��̜��s�U\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�!ƌӌZ\0\0\0\0PY�T\01eʔQYYY���ᣩ\r\0\0\0\0���*\0���O�>|��믿������}�����\0\0\0�� t@}��t��]ҽ�Q@Ct�����r�.��<�պ\\�������f{�>S�5U]�\'O\Z�x	~7�x��ڵ�kݺu�0��6m�]E��[]�t�򺭗.��ؿ�.}u�s��J��~���\0\0\0�@U� �B]:�2^��t9��\n]Rt��\n$$txP�/t��n�q�u	��/.T�K��3�\"땺������b]~��p]~ѥ�.���+EF8$$$DJ�p饗���m�Vu��ͽ~��ۮ�\n���.���j�\'=��Q\'��?���Kw]�u�D�	�cWY����>�\0\0\0\0�P�c�..]t�dun���o����J]6Z�_��(]>�e�@�e�.�uY_D��\n$<��z�@��k�s٣)<�4�e�2�sɷ��ty�\n6Z������p���n;p��i��6l�p�o���[�l�ч��D�*I��>]\"U~����\Z]^V���\r�����V�ݬ�\'��^���C\0\0\0\0����Y��?]���Y� @F,|e]�I��G]>T����[������0+0��m�K���\\��\n��������v�����.�ʇS$p���]����/��\"��ݻww��w���g�Ν;���pdT��dت��*D�]�X��6���#���%d��DB��*���T~�#�q�.kU�4�,>�\0\0\0\0��k��2T�t��Z��)xZ� ���U��!�������CV7�z�_U�\ZE�t�d-��^�V�t\0��?źO����e���+3p!�C�>}J�WF<t����o���o߾;v�ܹ���m����{r�$��%ͺ}�U_Bz��v$�K�.��b�����|�\0\0���)3Q_H��o���^S�/S%�V��dj�*���v8duhQ���~����E���	�����U���x+��jݷ�ѩ�����b�ĉ�<xМRq���֫W/��c�z<�aaa7V�!���]�Z���Y�7����r���.�rªϻ�\0BB���\n\0\0\0\0�P%�Y!��Y�w���N7X�W	��nu�}E�\\�(2� ��_DF8���,w.\ZYZ<L�<9���ň#n���:��Wt���)��5������oXA��>!�fd�����u�w\0\0\0���*�Am�~�&�J�,0y�k�uV�?�*�����%<{���\\n��}�u	�ON�b�]Ω�~ʔ)�bcc�-O��}�Ѡ���e�<Ⱥ2�DF������78����t��2�BF@|j]oaս�j9�G\0\0\0 t\0��L�hk�	{���uY�E��k9%�6��V�X{���׸K?���\"���dZA�u|!��_ف��Ç�\Z�\rl2%c��ɕ<8��.�4�A�Y�!��ʩ5%���;�/�\0\0\0��\"��e*=���*�������o�U��h��Y�O���x���Y/�ԗ�a�	G[ʱ���eJ�8�v\r����Z,��5��_R�.����qYy͉�u	��[��u0$���{\0\0\0���S��ZX�B���V\'u��S�;����)��*�,tU����J���_|��t��z�~��mr��I��P���E#\'L�P8����x��}�Ν�Z���e322Խ��{�~���W͛77���<x������\r���\\]�ÕPh�U\'��%�\\^uԿԫLA�5�X��@]���3�	m��\"?(�,\0\0\0�j�\n���#�0�8g�ߛ�*�T��p��3�p�ꫯ��`���nu��4��}�̙��o߮rrr���s������s�N5cƌ�����%K�|��:��}\0\0\0T1?�\0(�Q�mygyL^_�R;����ccc#�[4�K�.j˖-*99��a���4աCվ}{�w�^�b�\nu��i�~sĸq�̀©m۶���S�~��^x�={���Q�Wƾ\0\0\0\0\0��8,�5.��b������_]0�!77W}����w����6m�JMM-طq��J?�jѢE��զM?;x��⋷�����w\0\0\0� t\0ꈧ�~:,..�T�FJ�����bcc��Ax<���\"$$D]s�5��+��$x�޽{޷�~{ۅ^���F<\0\0\0\0���:`���C���˔��F88�:_|����4�K� #��~�ҨQ#5i�$p��k۶m@�n��6m�$S-v<\0\0\0\0 t\0j9�`E��PY��{�����4�f͚�g��5 J�]�v��w^η�~;��\0\0\0\0g��O���v՛1Ԅo�o�>%99y�����e	�^~�e�y��)B	Y�ᩧ�*�sFGG\'M�>]���0�x\0\0\0@}[p�{��]�R\r�q��Qu�M7��bԨQ��+t������o/�s��۷y�R><�w	\0\0\00=ShBT�p��ru���Ԇ\r����笋Gg�����r�A�MF:�Z���P;v�8v�ȑF�y1�\0\0\0�X����U%<**����=��?Ϟ=;�*���{��]�v�Z!d1�C���[��~����9%p�1cF�~ΰ%K�|�;\0\0��*44T6�:xp�1\0j�iӦ-=�s�Λ7/o�Ν�~����JKK+�MF<�N�<��y����Q��ܺu�8�$p\0\0\0\0@�\0�s��Y٬Y�;�6o���ż~X(P��bv�ܹ��1�K�.-���۷/~��ف\0\0\0\0l�@!�C�F��͝;7�l�CBB�Z�zu��!88�<[EHHH�m�N�R�6mR(��dJExxxS�0�8\0\0\0\0�:\0u����Wdff~�嗳K\n^{�5���]p�aÆj�رf�0~�xTp�~>s��Q{\r�0FFFF��]\0\0\0\0`#t\0꘥K�����2o޼�����7�Ç���܂ۺt颮��J�rϞ=U�޽�3X	\'���՚5k�x.�\Z\0\0\0\0�:\0uPdd��ӧO�>gΜ,��)))2\Z�����B�ǍW�III��w�5�6���K/�#�R\0\0\0�(�2��$x>|���f���ĉ��t�͚5����X�nQ�~2���u�m\0\0\0\0Ea�P��T�ӧO�*#�mۖW�)��}�\n\0\0\0\0%!t\0�8G�p����=�\"//��T\0\0\0\08B���!//o�����\n�E#k8\0\0\0\0(%B����<̜9S�Zd���E#�R\0\0\0���zD�����fϞ�S��A�i1	\0\0\0\0�\Z�P��T	^z��[�����}��gΜ�/�fJ\0\0\0��\"t\0�!	�6{�l����S��G�p������\Z\0\0\0��\"t\0�)�*���;d֬Y�-[�\n�g� p\0\0\0\0P^�@=&#rss�3g�kժU��=����㏓�5�R\0\0\0�\"�z����\Z�ٳG-Z���\0\0\0��@�\0@5l�p����;88x-�\0\0\0��\0�������O�>=�Z\0\0\0PQ�\0������a�R+\0\0\0\0*����x<7y�4`ذa��\0\0\0\0A�\0�saaa7�\\�V��rui���w#�\0\0\0�\"�z�����em�P;\0\0\0\0*�����7�y��gmo3fL�\0\0\0���z�]�vW�\\�3�n0#[o\Z�>}�)\0\0\0\0ʍ���ø���].��u?S,\0\0\0\0��PO��\n�0��`�2Ţ�\0\0\0�<�z�u����Z�-S��,33�?�\0\0\0�<������M�0�b�r�FS[\0\0\0\0���\n�z랳�o���0���Y.\0\0\0\0�L�zh�����Ii��)mڴ��Z\0\0\0PV�@=�r���q��5\0\0\0\0eŐi�Z�dɋz�����g�f�.�QQQ�PK\0\0\0\0*��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O�S@�3#��������Fedd�HOO�x<5�����}�����?���;�&���2\Z4hp\"00psNN�������S\0\0\0�<�@%;x��_�n�:+++�a۶m�����v���E��u��x\\iii-SSS\'$$�ꫯ~���5hР>�\0\0\0@���\n���ŭ<t�Ы-Z�hx�嗫Ν;��M�֊��V����٤IձcGկ_��N�:��Q�֭B�\0\0\0\05�ow�\0�8�2䢋.R:t�)\0TJi߾��ӧO���~o�ڵ�P#\0\0\0@�@�\0T�Rq���!=z�0���v:�:��ڷ�Y�w�3*n�;*+�W�\Z5j�z���r�����.�F\0\0\0��G�\0T�,\Z���8K�R8��}�JKܫ<y���䪌��Tܶ�	*�]�v����ͥ6\0\0\0��G�\0T���B��!�EI:����N?�v	 n�+Yǎ��������?���\0\0\0\0��PArZL9CEqk8d�0�AFA��n�:Ao�R\0\0\0@�\"t\0*(##�����8F^N�6<T��lٲ���&\0\0\0���O\0���BE� ��h�7��	\0\0\0�z1�� �ǣ�n�R��Ŗ�~�\0\0\0���9U\0�V@�9���߀\0\0\0\0�.B�ǚw�F�6:�v��`ռK*\0\0\0@�E�\0�X�V=U��=��=��ET\0\0\0�:���y9�gܖ{�\0\0\0�N#t\0|(;������J;�����دⶾi�\0\0\0\0u��#\'�nWq��R���\'#吊���J��F��J\0\0\0P�pJ9���ȅc�>1G2��\'/�����T�����vT\"\0\0\0�:��@%���\r�dDġ-�S�\0\0\0\0�B���ȅ�2<�T \0\0\0�:��@%�`�sT\0\0\0\0(F:\0\0\0\0\0\0!t\0\0\0\0\0\0>A�\0\0Ç344�\'j\0\0\0�8B�G���+�nݺB�7�P\'N����x�g\n.ϟ?_��}!���lu��au����>���v�k�����/|���{O<x���LNNV}�Q��[��7o^���[��e˖��g�cLKK�p0��4$�b��������	\0\0\0*��$Y�p�z��ݶh�\"u����M:ΧO�.�y^~�e�z��i^�����3/���*..μ,ۣG�����j�*���ϫ�~�I�ٳGEGG�-Z��ݻ�M�6�K/�T�<yRy<u�-���{������?��F�\Ze^^�z����Ն\r԰a���	/��EEE�N�:��������|�W\\a�7}�t3P�׷I@ѣG���r��I�\n�CJ۶m��ΐF��]�v�M�6j͚5�/�K���<�ațјO+\0\0\0@�\0�:��B:��RRR����j�8��b�\n�n��f���?n�o���one�ĠA�T�Ν������R����\Z5R_|�\nHxp�����޼_n=z�\n.��%<�ҰaC���VK�.US�N-�GFW8p@=��j���f0!A�������B��ظq��6m�Y���YDȱϞ=�f�j�SP7rܲ��͛�����O��۟��[�_Sҕ��a�\0\0\0��I�ɗε��\0�:v�X�zPP�jРAAG�ۗ_~�233�N�_��W�裏�#N�:e�cw�}���t�%��b�ʕ�СC�[�n�����Ăλ����}��jڴ���_�`��xEq��B�]<��攉�{N����رc�}2��\'�,t�D�1~��w���k�������!��m��V���	G�~$���Q��[oU#F�(Έ�MZZ�}q�.�%hp�\\|8\0\0\0B����x���Я_?u�w�?����}��W�9s��˗�#$p�����L����Xh9�V�Z�ہ�O?�T�]�V����!��o�� ���������_u�U��	$�c��?��d�¿��oդIsڇ�2�A���q��3 �0�駟6_C������s�9��L��i���o߾f\"�*��ݻB	[��ۧ�5kf����9���,�+SL���ֳ>��\Z���+������6#��\0*$\"***�j\0@�\0T1Y���F�����SoO��{yIH �AVV��y����?Ր!C�|�o��\Z���\n!!!�V֎��@�r�\\����,2)��,�(|���N�����m�֭��C���\n�.���2*a�������&���n����+d��L#�9s�JOO7ד�0E���^0Gt{ԃL+�c�0$55��z� �t���.�2�b����Q@�x�*\0@�\0T������_Q���,�(�z�!s� }Y�Q�s̘1CM�<�\\�@:�2�b�ر�Y�A�^�	{��ʰ~���אD���aE��\0ջwo3`�Q2��?V�ӟ��&L�`�k/i�2�B֨��2�3�N�#$���ƛ<�ԫ,��M�[X#*�P\r��bi]@��a×�l�:�r�J\0 t\0��t�mr��PW9m�,�(�7�dqE�p�W�x�`/6)dꅌ<�\"g~��e4�5�\\c�i�IFR�l�Ҝ� $,��\"$Eq�ƙA�L��E#_}�Us\Z���S�y��HX!���ܐ\r/�������(nM��&y�W\n-ji�),�s,Y���S�����\r�hQ�z����Z�>W����X��p�ghi@����P�vD�\0���N�8�|�/��C-[�\\K�����s��	dĂ�V���k�7�|cN5(�\r��Y;AF\0�B��� �� 2��ٯe/H�Yp��;��2�AN�)k9��.k6Ȉ\n{����:2B��g�5�yN}!��;dʇL��8etC�^�̑΅&����[��e�\\��d�i�f��x���jʧ\0\0\0 t\0j%����=������?sqF�\n �d-�� ���� %:I��y\nMY�Q�L���X� ���B�r�L���S�������(��\'����/�d�����>��L��2e����]w�e����i�Y)d��Y��;�Ts��=�,2eB�@��]���ɔ�E֛X�l��Ȥ8y���{�)2�C����O?��הo[d���rz۰aC���������\n5����)-\0\0\0\0B�擎��� A��M���/gU�۶o�nv���+����T���=�@�Y\'AF\"�t	!v�3.�>�d�=�A�$�Y\'dJ��5k����� �ɴ\rQ �3��ڵ��J�\"�Ĕ����,)?�	$|�5(d\n�M^S�		B�4�r�r�M�ד総CFQ�h	9��G1GHH(SҨoz��z3�\n ���WF@\0\0\0\0�@�&!BqS��?\\����.p�;�2�B�R������$�-\n\Z��o������8Y|�IFg�t\\r�	�BF]��Y.�ދ=�SLd�y\\I�u)�{�T�[�ͨ����\'%���\0\0\0T.7U\0Tr�rWm�rE]�f���$e	B����٧�,-�H	\0\0\0\0��D\0\0\0\0\0\0_ t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��P�F�v����A��qHor�	\0\0\0���KTP1AAA��:u���A���c�&��\0\0\0\0��PAO�<IE� 			�z���\0\0\0\0��PAYYY����sà2j�ؤ��>z�U\0\0\0T/B�������|\0\0 \0IDAT�͆a�:z�(�Q���|�ߏ��_�&j\0\0\0�^�@%���\Z����JeT����UIII�z<�I�\0\0\0P��J0hРuGwȞ={N<T	v�����r�Y�1�\0\0\0P��J2p������w�ܹ35...�5�LlLL̛�v�R_~X�S%\0\0\0@�@�\0T\"	��򮌍�����߿�������S������_T?��S�?V]��N�8�={�D~���III��m�8\0\0\0\05�?U\0T.�j!�5k�􍏏��\0}��.A5��?��C�����̙��\rVӫ��.�u�A��,\Z	\0\0\0�L����p�\r�z]�u̘1AYYY�rY֤X�hQpDDD�\"\0\0\0��`z\09��U��O�@�\0\0\0\0�(B\0b��a�R%\0\0\0\0*��������aÆ5�Z\0\0\0\0T�Pυ��ݨ7-7��u??��\0\0\0\0A�\0�s�ax�rpY�!�\0\0\0�� t\0��l�-���mrVj	\0\0\0@y:\0�X�v����o7#[o\Z�>}�)\0\0\0\0ʍ����R�/�[F@H��\0\0\0\0�F�\0�S2�����P�}�a���L�hFm\0\0\0(B��jݺ�\0��ժ�]����233�S[\0\0\0\0ʃ������n?�.���\ZMm\0\0\0(B���x<w�e�\0��0���Y.\0\0\0\0�L�zh���].WHi��)mڴ��Z\0\0\0PV�@=�r���q��5\0\0\0\0eŐiT�#F<�;�/s����Щ����\\�Z�X�dɋz��6��<#�.���y�Z\0\0\0PQ�t@�}���hj\0\0\0\0P�O�\nPY\"##W�q�����\0\0\0\0�n#t@e[~�����0VSU\0\0\0\0P�:�R���,���?.�k�\0\0\0\0u�*UÆ\r7�Mr	�钘�����\0\0\0�����*\"\"\"��r}R����0��6lȥ�\0\0\0\0�n#t@�3�b�2�sp��PK\0\0\0\0P�:����	�02��+@�����k�%\0\0\0\0��P�d����ٞZ���\0\0\0\0P?:�\'<ϧ��ax��_P;\0\0\0\0P?:�\'�;�Zo��.��_�{<������Ŏ�rJҧ�\0\0\0\0Չ�>!S(\\.�g^7�^�lY\Z���;.��%K��uyQ�˭r�.���\0\0\0\0TB���Y,\\.g��Y\'�^�S��{���t��*\ru9LU\0\0\0�*�T|%((hSVVV��\r\Zl�V���e	Y���\0\0\0���\0�����2c�\\v�\\��jŧn���d��W�˨\0\0\0\0Չ�����<xp|ZZڨ������A���gbb�ڼy�����;v�Qӎ��r\r\Z48�9\'\'gf������Eg]��e���DK\0\0\0P�j���e�֭����\Z�m�VI			Qnw��r�w�غ�x<���������~��W?dff�\Z4hPL-�h�K�wu���G=�si1\0\0\0\0��+j������z�E�\r/��rչsgմi�\Z8����I�&�cǎ�_�~��:u�#�֭[7���H�tyD����)��h�Ot�ʻ\0\0\0��0ҡ��A�!]t��QF�k߾��8��v�zo�ڵw\r8��Zt�v�O�x���?��3[x�\0\0\0\0U�IA\r\'S*80�G�E�ӎ����}�U{�=�⶿��R�Pq�ШQ#ջw�����g�}vq-:�Ǝ�o�2F��w\0\0\0@U!t�d�����Y2�������TZ�^���V�\'We$��ⶽM�PN<t������7�v����N\0\0\0�N�����B����EI:����N?�v	 n�˩cǎ�������_Em\0\0\0\0@�:�rZL9C���*���F3�(�_�֭�f(5\0\0\0\0eG�Pddd��3T���)��S�+�e˖�f\05\0\0\0\0e��+j�������*�\Z�zo�7��	\0\0\0\0(;F:��G�ݼU��@��p\0\0\0\0�ӧ�\nj���s��Ͽ#$\0\0\0\0\0ՃСh��\Z������U�.�� \0\0\0\0@� t�\Z��\Z��Q��!�/��\0\0\0\0\0ՂС����<��ӧ�\0\0\0\0@������{���;v�+>>��ѣG����gee)#$$$�y��G�4i��������ַ70;��J��#��|����O�Wq[�Tm{ަq��}��)���Ν;�V\0\0\0�52t����?|��;q�Ϟ=ՀT�N�T���UPP����r�:u*����m���wM�4).==��7�x����<�]��g*7;��}2R��ͯ�V��f��R.�[p���~:L��Y7�t�ڰa��\'�|�Ĵi�\"�\0\0\0\0u*tشi����_\'O�l\Z\Z���������O�)�Z�R�^z���{\\;w���ڸq�MJJ�uٲe���o��n8��s$Cix���O�A�>�\n\ni�\'&O�<4..�	&��-�6�7o�[�&Mʞ={�bj\0\0\0@y՘��\r��_�jպ����u���/�`�	Eő�B?����o� $$d����_]|�d�Bi\'��qh��|�Q@F8$&&.�0a���7�=���~����N�4�.j	\0\0\0@yՈ�A�/���k�^��#��[n��La��A�Ig*��vϽ���ko��\\(w]{r���>��~���n;p����KM�8�|��۩-\0\0\0\0�Q#�W|��Gk֮]{��)S����K�.��g�\r��?��bXX�������ʛv�����B$p���]����edCQ��Gy�o֬YK��a���*j\0\0\0@YT�HY���O?�n	�8����|�������.����a����xx��G�ť�G����\0\0\0P�\Z:�Y*֬Y���7߬~����5d�È#\Z���wx�Q�M�8�.�)gl<<��c��gEXX؍�\"\0\0\0�Ҫ��a�ʕo�i/e\r_\Z<xppӦM��Ө��F?��3��ϟ�rsϾ�Cvv�:|��:~�x�m�|�y����8���p���裏�W_}U��ӧ+ݡ-ry��[����}뭷�<��LF8���,w.\ZYZ<L�<9���ň#n�6\0\0\0���AF9�����b���ƍw���~�>���֭3�\0)?��c�e)G�U�7oVO=����O?�d�>��J�^�ZM�6Mm߾ݼ�p�Bu��	�w�^x�ku��Y�EWk֬)��͛������|���c8x�.�m���n��Ƃ�D�	�E�]��F�\Z�Vx�S�L�2eTll��	��ã�>\Z���e\0\0\0\0jt�{��ѿ��i�xWT�޽4h�-44�kU���5��˝Æ\rk\\��������3/�I䲔?�����+��0�ܷ{���u	\Z6lhv���>��6mj�-Z�P���ž^xx����.��iӦB��-[f��N�2_oȐ!fp�ꫯ���嗫���WFW,Z��1�8��^�$d���[�ƍ�����|������B��l����������}�k�p��ᅲ�Cy���ɓ\'<\0\0\0\0(�j;{Ŏ;�LEN�YV�z�J�����gV��O����=���;�ŏt٠;��\"\"\"�|��_~�����4G0����o��`@:�r[LL��ԩ������Ǐo�\Z��)S_ԡC�T�n�\n�O�@$&&\n��/dԂ\\�N������ڶmkn۴i�ڷoo���?������K��A���?6O�*���9ҼOF\\<���cǎf���4��;�s�9Ǽ<x���c�Q\r�ɷ�G��~���Z4rai�,C;2���ӧ/\r�C���U\n\0\0\0�F����}P��y�W6���~W\r���0�a_b���S�\Z\Z����Zw��=z4fÆ\r���zW_}��3g�Z�|��:u�8��-���/�?����С��ٗ���է�~�֮]����TFF�z�����p�UWz���(���(	5$����q���2\rD�_����q˨\n!�đ#G�����#2u��c�=f��7��-[��՝n������\Z��g���2?((heDDDJE��^4r	�����\0��ܹs�=F�]�M��4o��t}��䃰���\0\0\0\0�Rm�+t���Y�*�{�\r��o\r����]f���v����H��3r�Ȏyb�4ʈm�b�\n3���΁ak\"�H{D�		1��O�6�J�VF%�e}|f��,�`�i2rAF(ȴ���;��Hȱx�bկ_?s�8$\'\'��ǹ~�z3Xصk�9\r�(�.�R.��b38�/�k��tyG�\'����]���I�[4�Y�ff� Sh\n~	����^+�x	�k��h�Q�F����:�EC���L�\0\0\0\0P�j鐚��/���;��t�;Ww��We���޶��֝\'s���\'��r,F�/�EFF&�����֛P)2�@g����,�XVҩ��2�ᡇ2G	H�RF���3d��$��N1v�X�ӿt�Rsz�t���m��fv��$@��<��Q������{t�<�=%BY��&?�|�nOð>�TY�a̘1��3G@xO���gEaO퐩#r\\�&�\\���9�?s��0F_�?������+K3\'<<|tll��P�\Z�^{��V��4�g�\\�S)	~d��ݻw�����_���I�&E�`��=П��#F�.Y��c~�\0\0\0���A�]�aUڶm��3O����y��x�\08o�\0\"�q�P���i�\0�\"�%��>;v��~�R���L38p���������СCe�I��;vX E:���LOOW�\\s����S�k��.��M��I\0!�V:�	\n��O�6�y�QH�,���o.8�;�E~��sl���2�A�pH���<�y��|��d+���K��$.[�,��>�\r�3g��~�ׯ�_��i�s�_�e�Z�+)p8�\Z2ME�b�F��?�4�����a�9JEB��￿��Wd�V	�$x���\0\0\0\0�=tНSCw�\\U<�������˛���\"��.A��������!��u<Th����z��^�;�(+}L���K�+�c%H��AF,H�Q����o�X��&A��iOKKS�V�2G	8��� g��u�\"\"\"���������Z�E(���z9��gϞE�t�:��ty�b������{r�~�!��!	#�Q2B$:�	�z�]�����:���ׯ5^���������]k�O?�tXi!�J佖u;$p4��eb��62���s�-��$x�<yrތ3\"G�q7#\0\0\0\0Tk�ФI�����@�z_kԨ�	�Qˌ��z�\"��Rw<;:�m��`��\n�_Yg�(�|�o���zpp�����}��g��8etÃ>�&L�`~�/���l�u�e�E�\'d���Z�IF���`����~����]���r:M��~!S\0��}��O�z �\n9[�3t�5lΑ!������~�z�>��5��jm[Z�@�*!���@��ˣ��)V��cӦM#���v.\Zy6w�qG�N��l�i/�PEF�>�Tϧ_7��G�̜9s�#�\"x\0\0\0\0Pm�C�f��tgv����չ�k}�7ӱg{��:����:���u�z�/�����g��p�O��9�A:�f�kW5lذ�}�SJ��Hg��7�T�ƍ3�Ϛ5��ڝx�6\\ut��0�<��^��2�C�)��69��n�$�(��\r��ĉ�{��3�ꫯ*ݩ5�}(�t�%D)�����u������4��3&(++��PK0��ߖń�mc��P�װ>/N��#\\B���p(�H��v�;YsE��p.:y6�\\rI��<m���\0\0\0\0�u�×111���UEw��G�e5׹�2~��ݩN�ӷ���^/n�~y؝|�R!E��\r�͵M:�NΑ���ѣ�	�q�A��?տ�B��!׋��!�\Z��Nŭ!���w�c�RJ��\n:����clyk�2�̤>d���6	edZ��\Z�����;v4�,�>}�4�<yr��������`�\0\0\0����Sf�<y���h���>�����vy5׹�8��	���ݢ��&Wf�Pg�P�uoe���,�_����*�\\�z�D�?���]$�\r\Z4Ȝ*Q^r*L�u*����^���۷o��������t̘1�\0\0\0�z��F:<��s?=��#w��ٽ<�Ж՚5k>�x<]t?���ҦP��(a����آ�Gn�{�ѣGc������1���>}��z-o�/6<u2�A������;v�8�q��&�yo�uIx�\0\0\0B�*w��ɿ��b�Y�/�t|�$e���K���N���[Y#\ZP{�\"����P_��ɚ�Q��S�.|��\'3gϞ��C��\Z��ݻ�\\��9�B�$Y@s�֭e�b!�Ì3��s�\\�d	S+\0\0\0\0B�����o/7nܔO?���-���י9s��r葐�U]?kTT�L>n(�]~lР�ڲ��6m�҉\'fϛ7o����vă���yzT�s��ɓ\'�;�c�v(�T��[�{饗���E$\0\0�z�]��;6\\�bE����}���w��h۶m7��ԟ�΀�***�9]��w*9sV6k��N��۾}{����������⟲��Y@�.]Z��۷o_��ٳ	\0\0\0\0ت=t�5����<k֬��ǏW�s9r�/��b_��5922�G�n�e<4j�h�ܹss�<$$$��!u����ꩧ�R!!!��:uJmڴ�<�iIdJExxxS�0�8\0\0\0\0��k�A��������&���H��2������jdd���ը�ϟ�\"33s��/��]R���k������2}b�رf�0~�xTp�~>s���4c��`�H��V�.\0\0\0\0��kʁ,Z�h�ɓ\'���Ϧ�Z�*���Ly饗\"�M�v��㙺dɒy�Q�,]�tmNNΐy��e<lܸQ>|X���:ۨK�.��+�4/���S����<���p\"==]�\0s�s�\Z���\0\0\0\0jl� �,Y�;B}t��|�؎;2����?�<����ߖ-[�s�\\�EEEE��>���\\}�����̙��s�΂�SRRd4�\"8������7��-���Ի�knm2�A��G0�\0\0\0@Q�k��\Zz����;gΜ�@```�.��x���w��-�y��me�wff�1݁:�����߸q�����{���uԏ�����>�F��!r����o�5kֿ\'N�$��l֬��~���t�����R!����\r\0\0\0�V���a��,9rdǝ;w��[}��.Y�Ȅ���\"���B����E�ZH�0gΜ?����]v�_E�S�Y*\0\0\0\0˿��E����\0(#G�j�ĉ\r*<�S*8-&\0\0\0��pS@�\'�C^^��9s朎��.�*�����5\0\0\0\0��Cmx��nù�����CzS\'���$x�9sfֶm۲��X碑��\0\0\0\0����jx͗tiU��uy�,����_β�t]\Z��[����nԥEM����~9u���j����7�u��� \'\'�ٳg�6x���qZL\0\0\0\0�VU�C�.���mu���S�tp�w�.]�b\r���E<�Վ�@��ץ��k	�t�3\\��n�ˉ��&l<y�$��j�����7���$S-$xx饗��nݚ^Ҿ��틟9sf��8�)\0\0\0\0jj� !�\'VyB�����t9��O:5��2W埥BF\'Xہ�c��xN)���Ǭ��\\+��p�!G� �9��7)++kz|||�a|b�VlRRR�����`<��Ӱٳg��oߞZ�>��Cxxx��OF8���\0\0\0\0���nUx�]�:����0�\n�}F;��{t�\\�`���q��.��XA��V�!��e�L��K�z�]qQ�\\{�u�o�ѣG��V�����u�����7�şO�J����5k�k˖-��{\r����{\0\0\0\0�����\n�J����^�/޺��ʟR�.KT�i=���Fd9�S.�:��r�q��\"�AFMܦ�G:l���q�?+�8R�ߨ���Q������|j�@JJʪ���[=Ϥ��sʈ����;�̙�����O._�\\�_�>�^Á)\0\0\0\0jC� d�;T��r�9�`��\n�8n�R������(��V�����w�,ԥ�.��1����6�Q�\r�Qw��ٳ�$����ݻw�r�\\��S�^;xX�`A�|��x�\0\0\0\0�)t���:�3G<�Q�r�\'�W��d�I� S!�X��z�c��5���N�{U�4�Zm����9�s�Ν�qqqI��P�bcbb�ܵk�]���7�n	\\.�r�,[\0\0\0\0�%thU���ct��uV�0B9m�=���cdd�s}�r�c�,�㝮�/.T����C^^ޕ���[��uh�m\0\0 \0IDAT������ߑ�����x�4����C\'N��Ϟ={\"���댤��n����S�`3��-\0\0\0\0T�����˵��V��ô5r\\�a�?[�e!ȉ����O�y����yZL9��\'��O�����ce����cs��A�_Fb��\ro�L��͚5k�����e������P6����A�]���E#\0\0\0�.�rJ�oT�\"�ұ�����p\\�89=���Y����<X�kes�Lߐ�;��_�\"��e\n�����������p�\r�z��\0\0\0\0P�:t����R����y����\n���۳����{�q��U�����\0\0\0\0\0��M\0\0\0\0\0\0_ t\0\0\0\0\0\0>A�\0�]�8�ET\0\0\0��B�\0�]U�M~���b���\0\0\0\0Uş*\0��t�G埆6]�)f�.Y����/��\0\0\0PU��A�M���뺌��\\�}��V�W���\0\0\0\0TB�n�\\�-��8�\0\0\0@UaM�nK��k;^��\0\0\0@U!t\0궟�\"m}�\0\0\0�*1���S��2�AB�?�\\�u���kT\0\0\0��D�\0�\rˬ�$k8ܩKC]&�2G��T\0\0\0����\n��jhm3t	��I��h\0\0\0\0�9B���^4�\0\0\0\0�J:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O:\0\0\0\0\0\0� t\0\0\0\0\0\0>A�\0\0\0\0\0\0|��\0\0\0\0\0��\0\0\0\0\0�	B\0\0\0\0\0��\0\0\0\0\0�\'\0\0\0\0\0�O�S@�3bĈ\'\\.���=544t�󆨨(�\0\0\0���\0�ǆ�vGS\0\0\0\0|���\n��\'22r�a�J��aj\0\0\0@y:\0���ܟ\'�����\0\0\0P�@=e���#��\\�E�\0\0\0�� t\0ꩆ\rnԛ�v	�%1!!a#�\0\0\0�<�z*\"\"\"��r}R����0��6lȥ�\0\0\0\0��P���V1w��9����%\0\0\0\0�E�\0�c2u�0��\"�\n��p||�Zj	\0\0\0@y:\0��L�p��^7�S+V3�\0\0\0@E:\0������y�0�u�j\0\0\0@E:\0�ܱc�V�M�}��r��u���1�\0\0\0�\"�zN�P�\\�ϼn^�lٲ4j\0\0\0@E:\08�,.���V\0\0\0\0�0B\0*((h��z�\r6P+\0\0\0\0*�������2c�\\v�\\��j\0\0\0@E�S�o�N|���ǧ������葞���xj��&&&�͛7��.��ܱc�\Z5�8].�ѠA�����srrf���}-�H�V��#���/��{]���ԝvT[ЎhG�#��vD;�P������u��YYYY\r۶m�����(��f.��;j|����]�?������~��W?dff�\Z4hPL\r?t����r]��?�^��^C�m�^�/�����ڀvD;�юhG�#��\n-�dqqq+:�j�-\Z^~��s�ΪiӦ��TY��t=6i�Du��Q���/�S�N}$_�nݐ\Z~蹺dX���{���t��*\ru9̻L;�юhG�#��vB\0E�Ǥː�.�Hu��A��Q)>־}{էO�`���{k׮�����e�#�W�юhG�#��vD;�����d�݁�����Ll��N;�G����V�]�������J=B�U�F�\Z�޽{��?����.���*�y�]�L]��r��vD;�юhG�#��vB����B����d�]q�1��}�JKܫ<y���䪌��Tܶ������ڵ����on\r>���zɺ�Z�vD;�юhG�#�j_;�Pud5cY\\H��%���*7;����?�ă��Jұc���������ϯ����/]�e�.T�b^�юhG�#��v��׎PJ���r�$Yɸ��~�%�ޒ���n�:�ȑ#C��M5�w��.Su	�e�.W;?N���юhG�#��vD;���vB�j����?��y9�?��ϕ�e˖�Nj��٣�����W���_I�{��vD;�юhG�#�Q�mG(�/\0���$�kF���C;��(VM��q�\r]�x��\'<�#ЎhG�#��v�\ZߎPJ�t\0*����|�5��>���m�^���;F;�юhG�#�����aĈO�\\���{jhh�T�\rQQQ��<��&�\n�S�}�\rH��@;hG���k�;�Z(�^����w�F�6:�v��`ռK*��#�v�Z.22r��_��4חz!t\0�@�V=U��=��=��ET@;hG\0�u�a�)�~��K�:\0U$/\'��rO��b\0�@;hG�#�x�,�d�?.�kQ}�B�ǲӏ��mo���?�q_���*n��>\0hG\0���vkذ�F��UR�KbBB�FB\0v��v��[*#�`��d�R��_U�q�(�s;�#�vЎPkEDDd��YI���Wnذ!���	��|@�c�>1����e���:��j}�`d���ю\0�@;B-4_�;��\\.������>U#\0�����19Ir~h��T @;hG\0���L�0㌅?$pЛ����k�S}:\0> 	wy�\\*��#�v�ZJ�N�\\��\"?���>M�L�\0|����Q	�t�۷O9z���ܹ�)�@;��vD;B�e�\n��5�q�,�!_�Q�ꂑ\0P<���a��ɳn��&u����O>��j��#�f:v��j�I��{\'z<���[]:\0@\r7y��qqq�?�}�=���~ح�#{kҤIwU�a\\����*���v��8�5�b��ͫ�-[�F�\0\0�1����ĥ&L���K�����#��%\'\'�[��ݯ�w^��!ЎhG�ю�b�s^q�\\��J t\0�\Z*<<|��?���|�d��g�ի��8q���ރ>x{�@�������#�P����M��\r\Z4�@�\0\0�1����.��������Gy�/--m�=��3�\n����;���#��#Gv1b�����eYYY�U�����w��V����\0\0���H�<�C�$�\rӣ�>\Z�/.=z��>>��^��hG�#ЎhG�Raaa���󀓫���E�����\"*�?�� �B�\"�$RADQ0\n�(�TAQA��\0A� �l@h�\r��P�\0	$����Ν�}���f���~���ٙ7o�ܹ��s�=�ܽC�a����)�J�U��&��]\nm��������-[��ȑ#o\n�9P����t�s��<�������ॊ�׾��!a��\"L\\�v�%\r/+t�����n��Ў\nm��(Gʑ(Gʑ���9r�0ޯe���vmH;���p����>|�\"\"ҥ���hѢ�i��FA�3f��A�]1bĈ�,�uY���uh7g-y�ò!�?\nmT�\"tPD9R�D9R�d� ������y������#�8\";묳����\'���ӳ�������� W�V[m�\r<8=ն�}w�ר�\"�̏~�������f7�xc������k�ɮ��ښ�?�A��ss�����uq-�fͪ��c�=��s�=��y��_����|�ŋ�����;͙3���.]�ʍ�O<��y��]�2\n^��=�iȐ!�u���nh���(���d-!�g�֤)G�Qߓ#�H�C�=0u���kEg�{�M�81;vl�я~4{�ߜ��5�ɏի^���\roȶ�f\"���������D=�\Z5�s:Dd�Y�p!{�fm�Q��w�����׿�5=����=7�l�]w�4nVk��f��c�X6w�ܚ�5mڴ��n���~:��_���.����ș2eJn�����D+���q��c�=���?��O�:���s��s�\'�|�����K����c0����gO<�D�T��w��^��F��>f̘�V��ZBW�S��������B[�)G�Qߒ#�H�C\"f577��	��~:E$�u�]��s0�s<��9	�<��E<�t�FN8�l�M7����1+����e�,Z���Ϻ��\Z>0j���^�\\�7���pY�`Av�QG��s̻����[��V�����r�Zk��}����\r\"��@|�k_���_��\r�7��M�w7ޘo���5�ȝw�9_1��?���׽�u���z��q�֨�5�3���֦��_�	9�뇶Zh然ah���i�z5)ͫU��#�ȑ�r$�rP�a���?��ܓO>���=�>ޏ�$��s��l�_�L��&Xi�XHy��+�10�\\}��٠A-���A��\r7ܐ\r>���Z���y�駳[n��b �r��f�U^gE��/���^�o��<��q޻��kg��vZn�pM�Ї*�����K;�C��!C����&�y䑹ax�W�F$|����>������/})��?���*�<�C�՘�E��>�节����/|��������^�;�WG�\0㌉��[�κ<LZ�N�>�ڕ���B�>�S�p�ZV�؇���k�F�$V��2�#�H9��r$���<a.>?�T�0z��J\n��B&)8z�!�\"���w�~�g����׷��m�v�mWӰ�u�\"�UK�|�y�za��Vsܳ�>[�����޻r�5�\\��7�p�<�;���9B�O:���!,����vn�_�~��y:Q�[\r?�`�\rZ]�;���쮻�ʮ��ʼ�N\Zf�\rx�m��7c�V�.B���|��-�a�B���00<��Vy������g�dh+���W���Cۇ!���uCH�r�)G\"ʑr$=	�b�9��<����:R�E&�\Z���4�\"�\0y�KL�� !4��![o�u��o�ƍ�W/�UQB�9_����?�|+C���4L|ذa٫_��\n/����Gr��9(\"e�lzo���l��|���[���Y�M?�����y�<F7��o�=_\r��]��$��7�d�w�谠�R�H}����W�gܰ��\n=`�R ��󻭱�\Zy�a��㎣���N.�����)Gʑ�r�I/_��ô�)��|i�fss��u:�H��h��>��h���:�\\t��}�Ѫ������}�r�����&��\'?��ﾯX��F��?��V�=��s�<�(Lo}�[�0Jn���j��?�)����jE��6�!�1���Gx�g��G<�|�믿>������_t�E���������멟�T�^���0YQUx��Ç���t��.�����矟�.�̴�ؖ)�\"�퐨�u��������O�w���#�H9�Z9����s�;v��j5�d��lQދ�R�H�Z0����\n�;δg7�hՐ�z*AF\Z�U��I�t�#�Ev�RH�C檁���NI��t�$��H�k��c�=Ř{�p�o\n>�c�8N��\0�]=�-5$t:�H�0qp�g3�lc8��X\r�`\\q����O��V\rj��tP �3c��x�\"�sN���|��sw�}�+r�~n�@T����]�3Oa��r�3�<S�n����y����>8)Oa�$�����Q��E���R�Ĥt`��~��Ca������Cmh���N:iTT��*�Ū>���j�U�C���pZV�7�x��C�3fL��ӻz�)���&����.mO?)Gʑr�ur�����st�AÅ�!n՘:uj>��O���\'%*�,r\Z�Z.���,�����\\M�0���C�Q��Q<9�+��\r>��\'�G9�]rT\r�&�)\Z�|�c\Zs�b\n\nN8�,�u8%�����u�7c��6�D*�1��\0y�9>�Xccƌ��]v�e��E�!���R���w�������{EQnp&�ǵR��_�j+�$N�Zΐ�&CK�.�;�Dn��{g����ܯ��B��t(����oX��u<��7�1W��M���La�(7{&��}��ֽ���7�3�<��?�^{��wW�X��ƪD��>!�ŕ��C���˔�W_=WH�����wy�:&L>���v�m��!V&�?��5W�zh�Z3L<��.^���01_��r���W���KA��7(�E��b�}����U% |e\"|��A���������6z����ƍ�yP�>}�%�\\�\r]E!$�5��$�u��Kj��r�)G]+G�t����1�X\"7��R/��������)���]��3�#�Ố�G\\ ��&�ND2![�v�nD!q\r8�{>���p+C,\Z\\�JE� ����x��y�|�{���/��9��D�GD=9S�V-9�F<P�b�]v��HD$�i8r\0\'N0\"�[�����=y�\Z�<���ᓂ�#Q��^zi�R:� �����Ae�|�t��b4\\*�����;ِ��\'����7\"�89�;������*?7s��XG�z3��Pxn��8Mo�\n8�_���/�;�/�BF:�t#(0x�Y5!\Z%��/����Nq��I��	����J����w���*�+I���SO�W�	�KC�Dx=N�(bd�g��^u`b���A~Lt�Ē;^\\�29aT���$��Ge�Io>�]�U��G�M\'5��ަ�A8�p��{=&�����\'�|�Z9�� t��B($�T�����~�U�k[l����A)���]��T����G��ia�+Wf�I9R�����Q#��0ފ0���\"R�F�v�\"�$�6�?	�;aO�<9�կ~���)S���7��jD� c\'�xb�D(��}�\\:4�/$����(�\"8�b�c!\Zx4�\Z8\0YBn��`t��\\[*��=UE9�=�Q5p�0�����0vHG�9��!��6�BD\n�O��E�� ��Aq�u�e�<�H�|c���!Mi�-�l��2�Ccǎ��+���87��AZ_�����2���hk[��\"(�\0�d��=U[=�B�	��u�H�n\0#�Ʉ�c	P��UJ��\"?r����N?��<|�I&����D��\'�/v�[\rd*xLQ,97E��K\r+&\nإ0��X�@	\nB�<��(�����s�yT�P�P\\	7gRD��x �k�+�\\��U�QW�ۂ���	���=�smD��F�4|�ӟ~<�ٺ�(�G��0�c�1Sc��������ѽ�����?���0������\'V��Q?I?��끶�#�H9��]`��Dik�8�p�!s�5�~B�[)��\0B֪E�)?\\�����)-Y�$5�4iR�YE8�����2Hta�8b�Ct����\r�^;8���@��͛���UZ\"0h���`�qmq��E�H�H��Q=H1a�Μ93�8 �����>w���DĨ=�\"p�-[�,O�}S����B�\r�9�X�!NZ)}�;Q��y\rg5�E8&p20�1�01�I_�nJ�K���y�2��(\r@�9/��oj���jsi{�a9j%C|���֕ο�Ni�t4���\n(��i�7+�m@�϶}�`E5��r�u<J��E���Ji�&�T	a�y�1�����?����hJ�3[�~HwhC�|�7���O��H^/��cI�]+L��ԧ:2��Y>��DL6B����r�)G]#G4�����3v1�k��Fv�IW������8���`��FFj\0at�Z���(\"����4ҡY�x������Xe.:899c��\\��\"��z\ZY�W����\'��y���#=�~��Ap����ч�\r�y�Ǽ7ub�#�D\Z�w�}��L|DK�y\r��3�?��8&e�1����zGE�7�a�q���9�3�erT��w�6��(�c��>�N���b�((X(M�\Z�ⱂ�$\'9��ꅙ�krr�]/+\\�~DEe��y��I\rj�mj����0A�҉?W#],+ݪ�������?��=���p�l��R��J�G�\0y�+��k�M��k�y;se��~�K`q�*m���`�o�r�*&�?�^���\"D)`���C�(VE��0�Q\"	/�9�i�5!�bq����x)VqGY��u�ZT3�.wʑrTm<�z�cL�]`���B��h�siM��׃�Ɓ��Q&�f��+���(c�5V�g��馛Z�8\n97���`ѢE�\"���6�|����6�87��-!qB�T�u� E��6�B��Z�Q4�P�IE4s\n����s�����}/O=b�20FHM!*�z���\"��md B_�`.*F�U��H��DU	A�Qt8XH�IY�`A~ ł��\ry�VӨ�<���98(�dye��.�����06��1�+�ݩ:�tWn�:D�G�N8^oVx(D����L��p��ϥ��[l�E��^��O$V��f�mj�d��1p��$E�k�H^W��������:g0$kMP/S���\0\0IDAT2��Ihh�������7�6m�С�N�2e�	\'���ĉ���!��-�) �I�ߦ�!�a�~����[-\\�~A	����~Y�Ů��W�����������,(p;��c$l;��X彌aVW��a���P�Ie�c���d)-$����h��9�����N9�r��������.�����`쳲Y�M6�$���N��{·1��.�sIm���l�[�\"S�K�UX��o�{�c�\\q@��|���4ҁ�ki��V?w�Q����{/s���8Ͷ�j��)F$@\Z��1Θ���bS����	�|�U�GDFj�E~+��p��bAM!tD�?s��t�� �8�x/\rGv�!R���E8��n\"��I�z,�k�����l9���u�7^�iԕNΟ�N�V�Hs�\'Ԛ�V�(\Z�+Iռ��7��4D;Ҟ*�ծ\rC����2y�Y�s����^��ʊ\nմVcŧ�tI��7���Lq�i�]z�1Ǽ�ܙ���FW�P��oNW��&y����\Z]yJ��&LX-(\"tu��p�KʓwVV���Sg@Q|.��J���5�`��Fep�1�KK�Q/gD��A��O�(�(t�7��_T���X�\"��!�Ҷ\nʝr�Cr���0/�n>#�©�1�S�Zr�9���ض\"�b*+Ƽ��E�0�5G���b�u�}�4���\r`5�+�?Dn���ʮ1ʑ�Q\n�q��7:�T���!�����-n�D�!O�/~V�4B���z95!�+H���c��\'`,RYˑ_-B9%���\r8Y��8���#�����Rt��Ź(|���Ӂ����\n��M�n�\"ҭ��+�1����l��dLD�����n,*��H)VW����\'&��z��7�9�{\\����f%��~���D53�_��jVF�iҤI����_�;�Ѫ���/Z�dIM\0V%c�y����~[�|�ĉ��C�++vC��O���j[,(g�qS�.����%[��xaE��<\\�����g\\��N��(�GuT6{��Ã��PH�UӔ�!FK���br���Q�\0�p�^*�x\"$<�ꐮN�]`�]`�՜E8�0Jp4�b��h*�t�h��p�g��\0_���9s����u�\\��+�8�Y]�Z9>%uإ�Ep�`@�|t�\'��M�bL+AFIO�H}��G�8��B`��w1�k9���KS��ԦX\"M�cl}TX���>�#��9A}\n�2g�sŗ�#����>��h�8%��\0�>��8�Q�92�/��I��-2�����0���N��R�;�O�<:D��a��5��^�+HQ�+��D�t�3\ZF��Q�������$�J\Z�!�Z�^_�0�����^�қۻ2��&��ar�$(���)z((!���j69[_F��VR�m�D�q�Q��V�:�O+����)8�\0b<�|�ɕq���rĸ�p��+��ϑ-� �0�p����T��ŷb��b�9r�\nlq�\'�� �N�UI������nV7�y��vj�DC(���r�!�ˌN5\"(�䒐��b8�с�!C�x-\'�g��N�P����V5#03$��<�̊S��)8�qLv�*�r�7�#�\"�,\0���>$u(RL5 : :ې%�R\Z`����~�yM��[5C>�+�!�lM?��\'�L�ـ��#�K��=�Q.qH2���́�9�^�#D�\r�&\Z��\0�e\\+���Wd(ܛf-[���Ķ�����Ý��ٳgFT*?5S���tL�(�l��G�ԡdŽ�Y�a�J=(b(�Q���N����О*�(#���.+f�ZR\'ő�S���(\'�J�yMMM3;�2�+����&O����|�+Cj)zlkW6\0�BS��D����U�_|1?�X�0*x�g���O�>�/�S{�X��_�\0@FP~��G7Vu0XP�	[%����\"�%�O�0��@�h_e9L��wJ!��)\rGF��i��R�^�N9�r�ջ��`d��i�F�u��]#�V���z+�\\Cz���l��h՘�����#_i�[Q&�(�ù�}E�:��j�:�4��0���+�a~�� 1�´�rtHF\'E-���#���O:ݴi�5j��a�ݑ�#�7���Qp��\":n�1c�<�\"�m0�J=u��J7&<�qRA`�A���\\,\0��G�_��F�|ìY��#�8\"O�@1ë��F�b&I7rދJn_\"��ә���Ko��^g�}�G}tSQ���$t7]=dxV���q�C	e�UB:�!�;sf;��\Z�,N��w�^s�w��o��Cjdκ4R%�*\ra�~���PUR,R%�Ht4�:��j\n�#��}��ȝr�{��<�}��>9U5�\nsD[uv\Z��Q����|ٞk�����2�2�#p:��̨\'\"����J�C�T�q���D��A�j̹%��X��U�bu�T��E�jM��DE���q1,���؉E�x��+�}x�	�f�/;�����.Y��S�&MZL�^��:�c���M�o�{�EU�\\�%��pDw���e7�9V���]�Rc��[�al����+Eq{�(�s��QHp�D�� 䛨�bQH�N9Q�Dz���s3�Y�r��B$��ɓ�y�D9̟?F�7#D���ԬF�}+����>9�䢳j[�ym��7��XQ�E,qvPȋ\\]B�)(�*+z�����Ǐ��c��W���^�!a%��qqE	��YU���rHcZy��(������J��ԙ��%�!n��Ӏ��G悢P9q��1��<p��V��;�HD9�P��2�PS������8&M����#�ļ���J��o�����~q̈�=���8�alDb��~��	�6�gIq<\'&\n������(7��U[q�rw�z\Z��r1�^#�-�;6�|��#�B_RB[C���\n��ٳ�u�9Q�B�!�uUR��j e�-\0��� J ���p\n��0�;��Џ�D\Z�ԠvېQ�;�V�����\n��P�#�H��C����f������K�\Z�2�N:iٜ9sb�i_2���g:D�ST��	ՆSX�V����&�E��\n2�j�:��U�X��Ĳ�K�<�Q\"�<^Ťn��&���%U�bk0F^�BX���\n��SOͣ�?��p��g{�g��x�C�#DO�@U|�:���Q�p��|\nJ��ɮ\0���W�N9Q�Dz/aL��pxt<�x��1mڴ�ۘV��H�;vl\Z�@q��O�>�?�W�!#�qn���b���#�+��4��ro�{��v�i�>wF��|���C7�l���}_a�	9Z��6��}��ɝr��r��rT�#F��-�Jk��ع�HG��>�T%R/�x���VسgϦ-_�dI�4P���3fL�o��5D��0wQ��F��U��yW�b�}Ǎ7��c���[4ܱi�.CXge����T���r��(G\"}\"F���R�t[i���w�yg��R)�ǷRá?�T���\"\"���_~y�\'�<{��\ZU���ܜY�HD9�^���;{i/�J�Y���㭡}���hu8�t酐S��7a�����{�}��7n�1gVD9Q�Dz��0����7*�Jǆ�f�6/���C��ph�ǘ�6\n�َt���KE-L�饊ިQ��O�8���g�����\"�\\��������\"��(G\"=ȴi�p,L*7Ɍt���t�ҽƏ_���۟M_K�����(G\"ʑ��Vt:���bXa\n��>�&M*�v�m��sf\raQ�D�#�NgDh$��!pVﻶA{�Ўl�>o�������v\rmm�\"\"�U���������(G\"ʑH��]h&�Ss�U��q7��ж�Z��Qt�����\rm���8v+�MC{O�?�3�k���6�o\nm��s���N�E/�q�-�0�P�Q�D�#�.a��~��Cۣ�p\nlX�{|h�f-�!g��d�AA{>y���ma����&i�Ǐ����˟��о�8`y��:DD��!����i-�!Q�D�#�.�(��C��Q�ݞ��6�:	N);\Z\"We+�ސ<>�`oږYK��c�#n*w�s\n��e�\'�χ����SB����t.S�LYd/�(G\"ʑH��Tv`�_���2�(;^m��*��lE�£�c� �\'��@���mI�x�\Z���W>ש���qHh���Nu�L�,cw�B���n�Z\"~]~���1����)�{ޒ��f :a�*��;��%y���g��Ǭ�$����u�N���vEh��\Z&cB�S�5�ޛ��XD�g-iDD�7k)&yM�ǳ΋ݒǟJ��Kh���ҡ:DDDDDDDZ�%k٭[�����\0[X��p�oC��WC;\'��C;#��k�߻�o�<~,9fq���:���ڿ�G�G��������HKQG��SPG�H�b\ZDS�x�%>��l�.��I֒��C����q鶘�����%�yD��8CH�`g\rv���/t�N����vo���Y���t�2q	qzrl�<`\n�CR�a~��z��5�]���-1�|�3��4�S_�T�\"\"\"\"\"\"\"-�[��g���e+��|��HI#^h�1pL��~�<~2[�E��ʭOᖙ\"\"\"\"\"\"\"g�]�Jt:�������H���A�3i�����ul����`�RdG�#Q��#Q�D9R���e�.�8MMMO<��svD/`�ڹ۞P�D9R�D9�H9��G��H\'0x��[�y�;���c�������r$ʑr$ʑ(Gʑ�<:D:�ŋ�5������팞eނؚ�r�B9�H9�H�#�Hz�\"����o[���}��G�d�ܹ7���ѝv�����r$ʑr$ʑ(Gʑ�<:D:�ŋ8o޼�}�Y;�X�hѕ,�s�����ʑ(Gʑr��r�I�`�] �9L�:���:趧�~z�aÆ5\r:�N�ƉiΜ9�-�JG��η�#ʑ(Gʑr��r��N�~�E]t��x��?�w�Q>��\Zk���1]Ǽ�s�^6o޼�11��W�%ʑ(G�)G�)G�{PjD��뮻n�L4h��뮻��묳��Æ\r{}x��� ����IT3���~����.s��H�#Q��#Q��#�� ��p���oV*��\r?�Bk�W:�Ҭe��C���Bʑ(G�)G�)G\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"������l^D�\"\0\0\0\0IEND�B`�',NULL);

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

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('135064','流程审批测试流程',NULL,'','2018-01-07 18:09:37.652'),('145001','new-process',NULL,'','2018-01-09 19:32:28.374');

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

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('142501',8,'new-process','process',NULL,'2018-01-08 16:10:30.232','2018-01-09 19:32:29.885',1,'{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}','145001','142502','142503',''),('145005',4,'new-process','process',NULL,'2018-01-09 20:00:51.185','2018-01-09 20:01:00.256',1,'{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}',NULL,'145006','145007',''),('57501',31,'流程审批测试流程','test_audit02',NULL,'2017-11-12 08:42:12.515','2018-01-07 18:09:37.946',1,'{\"name\":\"流程审批测试流程\",\"revision\":1,\"description\":\"\"}','135064','57502','62501','');

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

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('process:1:145004',1,'http://www.activiti.org/processdef',NULL,'process',1,'145001','new-process.bpmn20.xml','new-process.process.png',NULL,0,1,1,''),('salary:3:135067',1,'http://www.activiti.org/test','流程审批测试流程','salary',3,'135064','流程审批测试流程.bpmn20.xml','流程审批测试流程.salary.png',NULL,1,1,1,'');

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
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

/*Data for the table `salary` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
