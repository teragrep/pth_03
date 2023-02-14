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

parser grammar DPLParserProcess;

import DPLParserAggregations,
       DPLParserEvals,
       DPLParserTransform_abstract,
       DPLParserTransform_accum,
       DPLParserTransform_addcoltotals,
       DPLParserTransform_addinfo,
       DPLParserTransform_addtotals,
       DPLParserTransform_analyzefields,
       DPLParserTransform_anomalies,
       DPLParserTransform_anomalousvalue,
       DPLParserTransform_anomalydetection,
       DPLParserTransform_appendcols,
       DPLParserTransform_append,
       DPLParserTransform_appendpipe,
       DPLParserTransform_arules,
       DPLParserTransform_associate,
       DPLParserTransform_audit,
       DPLParserTransform_autoregress,
       DPLParserTransform_bin,
       DPLParserTransform_bucketdir,
       DPLParserTransform_chart,
       DPLParserTransform_cluster,
       DPLParserTransform_cofilter,
       DPLParserTransform_collapse,
       DPLParserTransform_collect,
       DPLParserTransform_concurrency,
       DPLParserTransform_contingency,
       DPLParserTransform_convert,
       DPLParserTransform_correlate,
       DPLParserTransform_datamodel,
       DPLParserTransform_dbinspect,
       DPLParserTransform_dedup,
       DPLParserTransform_delete,
       DPLParserTransform_delta,
       DPLParserTransform_diff,
       DPLParserTransform_dpl,
       DPLParserTransform_dump,
       DPLParserTransform_erex,
       DPLParserTransform_eval,
       DPLParserTransform_eventcount,
       DPLParserTransform_eventstats,
       DPLParserTransform_explain,
       DPLParserTransform_extract,
       DPLParserTransform_fieldformat,
       DPLParserTransform_fields,
       DPLParserTransform_fieldsummary,
       DPLParserTransform_filldown,
       DPLParserTransform_fillnull,
       DPLParserTransform_findkeywords,
       DPLParserTransform_findtypes,
       DPLParserTransform_folderize,
       DPLParserTransform_foreach,
       DPLParserTransform_format,
       DPLParserTransform_from,
       DPLParserTransform_gauge,
       DPLParserTransform_gentimes,
       DPLParserTransform_geomfilter,
       DPLParserTransform_geom,
       DPLParserTransform_geostats,
       DPLParserTransform_head,
       DPLParserTransform_highlight,
       DPLParserTransform_history,
       DPLParserTransform_iconify,
       DPLParserTransform_inputcsv,
       DPLParserTransform_inputlookup,
       DPLParserTransform_iplocation,
       DPLParserTransform_join,
       DPLParserTransform_kmeans,
       DPLParserTransform_kvform,
       DPLParserTransform_loadjob,
       DPLParserTransform_localize,
       DPLParserTransform_localop,
       DPLParserTransform_lookup,
       DPLParserTransform_makecontinuous,
       DPLParserTransform_makejson,
       DPLParserTransform_makemv,
       DPLParserTransform_makeresults,
       DPLParserTransform_map,
       DPLParserTransform_mcatalog,
       DPLParserTransform_mcollect,
       DPLParserTransform_metadata,
       DPLParserTransform_metasearch,
       DPLParserTransform_meventcollect,
       DPLParserTransform_mstats,
       DPLParserTransform_multikv,
       DPLParserTransform_multisearch,
       DPLParserTransform_mvcombine,
       DPLParserTransform_mvexpand,
       DPLParserTransform_nomv,
       DPLParserTransform_outlier,
       DPLParserTransform_outputcsv,
       DPLParserTransform_outputlookup,
       DPLParserTransform_outputtext,
       DPLParserTransform_overlap,
       DPLParserTransform_pivot,
       DPLParserTransform_predict,
       DPLParserTransform_rangemap,
       DPLParserTransform_rare,
       DPLParserTransform_redistribute,
       DPLParserTransform_regex,
       DPLParserTransform_relevancy,
       DPLParserTransform_reltime,
       DPLParserTransform_rename,
       DPLParserTransform_replace,
       DPLParserTransform_rest,
       DPLParserTransform_return,
       DPLParserTransform_reverse,
       DPLParserTransform_rex4j,
       DPLParserTransform_rex,
       DPLParserTransform_rtorder,
       DPLParserTransform_runshellscript,
       DPLParserTransform_savedsearch,
       DPLParserTransform_script,
       DPLParserTransform_scrub,
       DPLParserTransform_search,
       DPLParserTransform_searchtxn,
       DPLParserTransform_selfjoin,
       DPLParserTransform_sendalert,
       DPLParserTransform_sendemail,
       DPLParserTransform_setfields,
       DPLParserTransform_set,
       DPLParserTransform_sichart,
       DPLParserTransform_sirare,
       DPLParserTransform_sistats,
       DPLParserTransform_sitimechart,
       DPLParserTransform_sitop,
       DPLParserTransform_sort,
       DPLParserTransform_spath,
       DPLParserTransform_stats,
       DPLParserTransform_strcat,
       DPLParserTransform_streamstats,
       DPLParserTransform_table,
       DPLParserTransform_tags,
       DPLParserTransform_tail,
       DPLParserTransform_teragrep,
       DPLParserTransform_timechart,
       DPLParserTransform_timewrap,
       DPLParserTransform_top,
       DPLParserTransform_transaction,
       DPLParserTransform_transpose,
       DPLParserTransform_trendline,
       DPLParserTransform_tscollect,
       DPLParserTransform_tstats,
       DPLParserTransform_typeahead,
       DPLParserTransform_typelearner,
       DPLParserTransform_typer,
       DPLParserTransform_union,
       DPLParserTransform_uniq,
       DPLParserTransform_untable,
       DPLParserTransform_where,
       DPLParserTransform_x11,
       DPLParserTransform_xmlkv,
       DPLParserTransform_xmlunescape,
       DPLParserTransform_xpath,
       DPLParserTransform_xyseries;

// statements

transformStatement
        : PIPE abstractTransformation transformStatement?
        | PIPE accumTransformation transformStatement?
        | PIPE addcoltotalsTransformation transformStatement?
        | PIPE addinfoTransformation transformStatement?
        | PIPE addtotalsTransformation transformStatement?
        | PIPE analyzefieldsTransformation transformStatement?
        | PIPE anomaliesTransformation transformStatement?
        | PIPE anomalousvalueTransformation transformStatement?
        | PIPE anomalydetectionTransformation transformStatement?
        | PIPE appendTransformation transformStatement?
        | PIPE appendcolsTransformation transformStatement?
        | PIPE appendpipeTransformation transformStatement?
        | PIPE arulesTransformation transformStatement?
        | PIPE associateTransformation transformStatement?
        | PIPE auditTransformation transformStatement?
        | PIPE autoregressTransformation transformStatement?
        | PIPE binTransformation transformStatement?
        | PIPE bucketdirTransformation transformStatement?
        | PIPE chartTransformation transformStatement?
        | PIPE clusterTransformation transformStatement?
        | PIPE cofilterTransformation transformStatement?
        | PIPE collapseTransformation transformStatement?
        | PIPE collectTransformation transformStatement?
        | PIPE concurrencyTransformation transformStatement?
        | PIPE contingencyTransformation transformStatement?
        | PIPE convertTransformation transformStatement?
        | PIPE correlateTransformation transformStatement?
        | PIPE datamodelTransformation transformStatement?
        | PIPE dbinspectTransformation transformStatement?
        | PIPE dedupTransformation transformStatement?
        | PIPE deleteTransformation transformStatement?
        | PIPE deltaTransformation transformStatement?
        | PIPE diffTransformation transformStatement?
	| PIPE dplTransformation transformStatement?
        | PIPE dumpTransformation transformStatement?
        | PIPE erexTransformation transformStatement?
        | PIPE evalTransformation transformStatement?
        | PIPE eventcountTransformation transformStatement?
        | PIPE eventstatsTransformation transformStatement?
	| PIPE explainTransformation transformStatement?
        | PIPE extractTransformation transformStatement?
        | PIPE fieldformatTransformation transformStatement?
        | PIPE fieldsTransformation transformStatement?
        | PIPE fieldsummaryTransformation transformStatement?
        | PIPE filldownTransformation transformStatement?
        | PIPE fillnullTransformation transformStatement?
        | PIPE findkeywordsTransformation transformStatement?
        | PIPE findtypesTransformation transformStatement?
        | PIPE folderizeTransformation transformStatement?
        | PIPE foreachTransformation transformStatement?
        | PIPE formatTransformation transformStatement?
        | PIPE fromTransformation transformStatement?
        | PIPE gaugeTransformation transformStatement?
        | PIPE gentimesTransformation transformStatement?
        | PIPE geomTransformation transformStatement?
        | PIPE geomfilterTransformation transformStatement?
        | PIPE geostatsTransformation transformStatement?
        | PIPE headTransformation transformStatement?
        | PIPE highlightTransformation transformStatement?
        | PIPE historyTransformation transformStatement?
        | PIPE iconifyTransformation transformStatement?
        | PIPE inputcsvTransformation transformStatement?
        | PIPE inputlookupTransformation transformStatement?
        | PIPE iplocationTransformation transformStatement?
        | PIPE joinTransformation transformStatement?
        | PIPE kmeansTransformation transformStatement?
        | PIPE kvformTransformation transformStatement?
        | PIPE loadjobTransformation transformStatement?
        | PIPE localizeTransformation transformStatement?
        | PIPE localopTransformation transformStatement?
        | PIPE lookupTransformation transformStatement?
        | PIPE makecontinuousTransformation transformStatement?
        | PIPE makejsonTransformation transformStatement?
        | PIPE makemvTransformation transformStatement?
        | PIPE makeresultsTransformation transformStatement?
        | PIPE mapTransformation transformStatement?
        | PIPE mcatalogTransformation transformStatement?
        | PIPE mcollectTransformation transformStatement?
        | PIPE metadataTransformation transformStatement?
        | PIPE metasearchTransformation transformStatement?
        | PIPE meventcollectTransformation transformStatement?
        | PIPE mstatsTransformation transformStatement?
        | PIPE multikvTransformation transformStatement?
        | PIPE multisearchTransformation transformStatement?
        | PIPE mvcombineTransformation transformStatement?
        | PIPE mvexpandTransformation transformStatement?
        | PIPE nomvTransformation transformStatement?
        | PIPE outlierTransformation transformStatement?
        | PIPE outputcsvTransformation transformStatement?
        | PIPE outputlookupTransformation transformStatement?
        | PIPE outputtextTransformation transformStatement?
        | PIPE overlapTransformation transformStatement?
        | PIPE pivotTransformation transformStatement?
        | PIPE predictTransformation transformStatement?
        | PIPE rangemapTransformation transformStatement?
        | PIPE rareTransformation transformStatement?
        | PIPE redistributeTransformation transformStatement?
        | PIPE regexTransformation transformStatement?
        | PIPE relevancyTransformation transformStatement?
        | PIPE reltimeTransformation transformStatement?
        | PIPE renameTransformation transformStatement?
        | PIPE replaceTransformation transformStatement?
        | PIPE restTransformation transformStatement?
        | PIPE returnTransformation transformStatement?
        | PIPE reverseTransformation transformStatement?
	| PIPE rex4jTransformation transformStatement?
        | PIPE rexTransformation transformStatement?
        | PIPE rtorderTransformation transformStatement?
        | PIPE runshellscriptTransformation transformStatement?
        | PIPE savedsearchTransformation transformStatement?
        | PIPE scriptTransformation transformStatement?
        | PIPE scrubTransformation transformStatement?
        | PIPE searchTransformation transformStatement?
        | PIPE searchtxnTransformation transformStatement?
        | PIPE selfjoinTransformation transformStatement?
        | PIPE sendalertTransformation transformStatement?
        | PIPE sendemailTransformation transformStatement?
        | PIPE setTransformation transformStatement?
        | PIPE setfieldsTransformation transformStatement?
        | PIPE sichartTransformation transformStatement?
        | PIPE sirareTransformation transformStatement?
        | PIPE sistatsTransformation transformStatement?
        | PIPE sitimechartTransformation transformStatement?
        | PIPE sitopTransformation transformStatement?
        | PIPE sortTransformation transformStatement?
        | PIPE spathTransformation transformStatement?
        | PIPE statsTransformation transformStatement?
        | PIPE strcatTransformation transformStatement?
        | PIPE streamstatsTransformation transformStatement?
        | PIPE tableTransformation transformStatement?
        | PIPE tagsTransformation transformStatement?
        | PIPE tailTransformation transformStatement?
	| PIPE teragrepTransformation transformStatement?
        | PIPE timechartTransformation transformStatement?
        | PIPE timewrapTransformation transformStatement?
        | PIPE topTransformation transformStatement?
        | PIPE transactionTransformation transformStatement?
        | PIPE transposeTransformation transformStatement?
        | PIPE trendlineTransformation transformStatement?
        | PIPE tscollectTransformation transformStatement?
        | PIPE tstatsTransformation transformStatement?
        | PIPE typeaheadTransformation transformStatement?
        | PIPE typelearnerTransformation transformStatement?
        | PIPE typerTransformation transformStatement?
        | PIPE unionTransformation transformStatement?
        | PIPE uniqTransformation transformStatement?
        | PIPE untableTransformation transformStatement?
        | PIPE whereTransformation transformStatement?
        | PIPE x11Transformation transformStatement?
        | PIPE xmlkvTransformation transformStatement?
        | PIPE xmlunescapeTransformation transformStatement?
        | PIPE xpathTransformation transformStatement?
        | PIPE xyseriesTransformation transformStatement?
        | EOF
        ;

subsearchTransformStatement
        : abstractTransformation transformStatement?
        | accumTransformation transformStatement?
        | addcoltotalsTransformation transformStatement?
        | addinfoTransformation transformStatement?
        | addtotalsTransformation transformStatement?
        | analyzefieldsTransformation transformStatement?
        | anomaliesTransformation transformStatement?
        | anomalousvalueTransformation transformStatement?
        | anomalydetectionTransformation transformStatement?
        | appendTransformation transformStatement?
        | appendcolsTransformation transformStatement?
        | appendpipeTransformation transformStatement?
        | arulesTransformation transformStatement?
        | associateTransformation transformStatement?
        | auditTransformation transformStatement?
        | autoregressTransformation transformStatement?
        | binTransformation transformStatement?
        | bucketdirTransformation transformStatement?
        | chartTransformation transformStatement?
        | clusterTransformation transformStatement?
        | cofilterTransformation transformStatement?
        | collapseTransformation transformStatement?
        | collectTransformation transformStatement?
        | concurrencyTransformation transformStatement?
        | contingencyTransformation transformStatement?
        | convertTransformation transformStatement?
        | correlateTransformation transformStatement?
        | datamodelTransformation transformStatement?
        | dbinspectTransformation transformStatement?
        | dedupTransformation transformStatement?
        | deleteTransformation transformStatement?
        | deltaTransformation transformStatement?
        | diffTransformation transformStatement?
	| dplTransformation transformStatement?
        | dumpTransformation transformStatement?
        | erexTransformation transformStatement?
        | evalTransformation transformStatement?
        | eventcountTransformation transformStatement?
        | eventstatsTransformation transformStatement?
	| explainTransformation transformStatement?
        | extractTransformation transformStatement?
        | fieldformatTransformation transformStatement?
        | fieldsTransformation transformStatement?
        | fieldsummaryTransformation transformStatement?
        | filldownTransformation transformStatement?
        | fillnullTransformation transformStatement?
        | findkeywordsTransformation transformStatement?
        | findtypesTransformation transformStatement?
        | folderizeTransformation transformStatement?
        | foreachTransformation transformStatement?
        | formatTransformation transformStatement?
        | fromTransformation transformStatement?
        | gaugeTransformation transformStatement?
        | gentimesTransformation transformStatement?
        | geomTransformation transformStatement?
        | geomfilterTransformation transformStatement?
        | geostatsTransformation transformStatement?
        | headTransformation transformStatement?
        | highlightTransformation transformStatement?
        | historyTransformation transformStatement?
        | iconifyTransformation transformStatement?
        | inputcsvTransformation transformStatement?
        | inputlookupTransformation transformStatement?
        | iplocationTransformation transformStatement?
        | joinTransformation transformStatement?
        | kmeansTransformation transformStatement?
        | kvformTransformation transformStatement?
        | loadjobTransformation transformStatement?
        | localizeTransformation transformStatement?
        | localopTransformation transformStatement?
        | lookupTransformation transformStatement?
        | makecontinuousTransformation transformStatement?
        | makejsonTransformation transformStatement?
        | makemvTransformation transformStatement?
        | makeresultsTransformation transformStatement?
        | mapTransformation transformStatement?
        | mcatalogTransformation transformStatement?
        | mcollectTransformation transformStatement?
        | metadataTransformation transformStatement?
        | metasearchTransformation transformStatement?
        | meventcollectTransformation transformStatement?
        | mstatsTransformation transformStatement?
        | multikvTransformation transformStatement?
        | multisearchTransformation transformStatement?
        | mvcombineTransformation transformStatement?
        | mvexpandTransformation transformStatement?
        | nomvTransformation transformStatement?
        | outlierTransformation transformStatement?
        | outputcsvTransformation transformStatement?
        | outputlookupTransformation transformStatement?
        | outputtextTransformation transformStatement?
        | overlapTransformation transformStatement?
        | pivotTransformation transformStatement?
        | predictTransformation transformStatement?
        | rangemapTransformation transformStatement?
        | rareTransformation transformStatement?
        | redistributeTransformation transformStatement?
        | regexTransformation transformStatement?
        | relevancyTransformation transformStatement?
        | reltimeTransformation transformStatement?
        | renameTransformation transformStatement?
        | replaceTransformation transformStatement?
        | restTransformation transformStatement?
        | returnTransformation transformStatement?
        | reverseTransformation transformStatement?
	| rex4jTransformation transformStatement?
        | rexTransformation transformStatement?
        | rtorderTransformation transformStatement?
        | runshellscriptTransformation transformStatement?
        | savedsearchTransformation transformStatement?
        | scriptTransformation transformStatement?
        | scrubTransformation transformStatement?
        | searchTransformation transformStatement?
        | searchtxnTransformation transformStatement?
        | selfjoinTransformation transformStatement?
        | sendalertTransformation transformStatement?
        | sendemailTransformation transformStatement?
        | setTransformation transformStatement?
        | setfieldsTransformation transformStatement?
        | sichartTransformation transformStatement?
        | sirareTransformation transformStatement?
        | sistatsTransformation transformStatement?
        | sitimechartTransformation transformStatement?
        | sitopTransformation transformStatement?
        | sortTransformation transformStatement?
        | spathTransformation transformStatement?
        | statsTransformation transformStatement?
        | strcatTransformation transformStatement?
        | streamstatsTransformation transformStatement?
        | tableTransformation transformStatement?
        | tagsTransformation transformStatement?
        | tailTransformation transformStatement?
	| teragrepTransformation transformStatement?
        | timechartTransformation transformStatement?
        | timewrapTransformation transformStatement?
        | topTransformation transformStatement?
        | transactionTransformation transformStatement?
        | transposeTransformation transformStatement?
        | trendlineTransformation transformStatement?
        | tscollectTransformation transformStatement?
        | tstatsTransformation transformStatement?
        | typeaheadTransformation transformStatement?
        | typelearnerTransformation transformStatement?
        | typerTransformation transformStatement?
        | unionTransformation transformStatement?
        | uniqTransformation transformStatement?
        | untableTransformation transformStatement?
        | whereTransformation transformStatement?
        | x11Transformation transformStatement?
        | xmlkvTransformation transformStatement?
        | xmlunescapeTransformation transformStatement?
        | xpathTransformation transformStatement?
        | xyseriesTransformation transformStatement?
        ;

