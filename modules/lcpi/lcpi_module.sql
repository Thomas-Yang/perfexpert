--
-- Copyright (c) 2011-2013  University of Texas at Austin. All rights reserved.
--
-- $COPYRIGHT$
--
-- Additional copyrights may follow
--
-- This file is part of PerfExpert.
--
-- PerfExpert is free software: you can redistribute it and/or modify it under
-- the terms of the The University of Texas at Austin Research License
--
-- PerfExpert is distributed in the hope that it will be useful, but WITHOUT ANY
-- WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
-- A PARTICULAR PURPOSE.
--
-- Authors: Leonardo Fialho and Ashay Rane
--
-- $HEADER$
--

--
-- Enable foreign keys
--
PRAGMA foreign_keys = ON;

--
-- Create tables if not exist
--
CREATE TABLE IF NOT EXISTS lcpi_metric (
    id            INTEGER PRIMARY KEY,
    name          VARCHAR NOT NULL,
    value         REAL    NOT NULL,
    hotspot_id    INTEGER NOT NULL,

    FOREIGN KEY (hotspot_id) REFERENCES hpctoolkit_hotspot(id)
);
