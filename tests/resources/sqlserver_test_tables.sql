-- Copyright 2023 Google LLC
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

use guestbook;
CREATE SCHEMA pso_data_validator;

-- Core data types test table, to be kept in sync with same table in other SQL engines
DROP TABLE IF EXISTS pso_data_validator.dvt_core_types;
CREATE TABLE pso_data_validator.dvt_core_types
(   id              int NOT NULL PRIMARY KEY
,   col_int8        tinyint
,   col_int16       smallint
,   col_int32       int
,   col_int64       bigint
,   col_dec_20      decimal(20)
,   col_dec_38      decimal(38)
,   col_dec_10_2    decimal(10,2)
,   col_float32     float(24)
,   col_float64     float(53)
,   col_varchar_30  varchar(30)
,   col_char_2      char(2)
,   col_string      text
,   col_date        date
,   col_datetime    datetime2(3)
,   col_tstz        datetimeoffset(3)
);

INSERT INTO pso_data_validator.dvt_core_types VALUES
(1,1,1,1,1
,12345678901234567890,1234567890123456789012345,123.11,123456.1,12345678.1
,'Hello DVT','A ','Hello DVT'
,'1970-01-01','1970-01-01 00:00:01'
,cast('1970-01-01 00:00:01 -01:00' as datetimeoffset(3)));
INSERT INTO pso_data_validator.dvt_core_types VALUES
(2,2,2,2,2
,12345678901234567890,1234567890123456789012345,123.22,123456.2,12345678.2
,'Hello DVT','B ','Hello DVT'
,'1970-01-02','1970-01-02 00:00:02'
,cast('1970-01-02 00:00:02 -02:00' as datetimeoffset(3)));
INSERT INTO pso_data_validator.dvt_core_types VALUES
(3,3,3,3,3
,12345678901234567890,1234567890123456789012345,123.33,123456.3,12345678.3
,'Hello DVT','C ','Hello DVT'
,'1970-01-03','1970-01-03 00:00:03'
,cast('1970-01-03 00:00:03 -03:00' as datetimeoffset(3)));

DROP TABLE pso_data_validator.dvt_null_not_null;
CREATE TABLE pso_data_validator.dvt_null_not_null
(   col_nn             datetime2(0) NOT NULL
,   col_nullable       datetime2(0)
,   col_src_nn_trg_n   datetime2(0) NOT NULL
,   col_src_n_trg_nn   datetime2(0)
);

DROP TABLE pso_data_validator.dvt_large_decimals;
CREATE TABLE pso_data_validator.dvt_large_decimals
(   id              decimal(38) NOT NULL PRIMARY KEY
,   col_data        varchar(10)
,   col_dec_18      decimal(18)
,   col_dec_38      decimal(38)
,   col_dec_38_9    decimal(38,9)
,   col_dec_38_30   decimal(38,30)
);

INSERT INTO pso_data_validator.dvt_large_decimals VALUES
(123456789012345678901234567890
,'Row 1'
,123456789012345678
,12345678901234567890123456789012345678
,12345678901234567890123456789.123456789
,12345678.123456789012345678901234567890);
INSERT INTO pso_data_validator.dvt_large_decimals VALUES
(223456789012345678901234567890
,'Row 2'
,223456789012345678
,22345678901234567890123456789012345678
,22345678901234567890123456789.123456789
,22345678.123456789012345678901234567890);
INSERT INTO pso_data_validator.dvt_large_decimals VALUES
(323456789012345678901234567890
,'Row 3'
,323456789012345678
,32345678901234567890123456789012345678
,32345678901234567890123456789.123456789
,32345678.123456789012345678901234567890);
