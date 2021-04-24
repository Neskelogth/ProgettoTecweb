-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Creato il: Apr 24, 2021 alle 13:40
-- Versione del server: 10.4.13-MariaDB
-- Versione PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtesser`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `alimentazione`
--

DROP TABLE IF EXISTS `alimentazione`;
CREATE TABLE IF NOT EXISTS `alimentazione` (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) NOT NULL,
  `Descrizione` text NOT NULL,
  `NomeImmagine` varchar(150) NOT NULL,
  `AltImmagine` text NOT NULL,
  `Ingredienti` text NOT NULL,
  `Procedimento` text NOT NULL,
  `Consigli` text NOT NULL,
  `Persone` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `alimentazione`
--

INSERT INTO `alimentazione` (`ID`, `Nome`, `Descrizione`, `NomeImmagine`, `AltImmagine`, `Ingredienti`, `Procedimento`, `Consigli`, `Persone`) VALUES
(1, 'UGFzdGEgYWwgY2hpbGk=', 'VW5hIHBhc3RhIHByb3RlaWNhIGUgcmljY2EgZGkgZmlicmUsIHNhbHV0YXJlIGUgZ3VzdG9zYSwgb3R0aW1hIHBlciBjaGkgdnVvbGUgYWxsZW5hcnNpLg==', 'aW1hZ2VzL2NoaWxpUGFzdGEuanBn', 'UGlhdHRvIGRpIHBhc3RhIGFsIHN1Z28gZGkgcG9tb2Rvcm8gY29uIGZhZ2lvbGksIHBlenpldHRpIGRpIG1hbnpvIGUgbWFpcw==', 'TWV6em8gY3VjY2hpYWlvIGRpIG9saW8gZGkgb2xpdmEKTWV6emEgY2lwb2xsYQoxIHNwaWNjaGlvIGQnYWdsaW8KMTI1ZyBkaSBtYW56byBtYWNpbmF0bwoxIGN1Y2NoaWFpbyBkaSBmYXJpbmEKMSBjdWNjaGlhaW8gZGkgcG9sdmVyZSBkaSBwZXBlcm9uY2lubwo0MjVnIGRpIHBhc3NhdGEgZGkgcG9tb2Rvcm8KMjAwZyBkaSBwb21vZG9yaSBhIGRhZGluaQoyMDBnIGRpIGZhZ2lvbGkgbmVyaQoyMDBnIGRpIGZhZ2lvbGkgcm9zc2kKTWV6emEgdGF6emEgZGkgY2hpY2NoaSBkaSBtYWlzClVuYSB0YXp6YSBkaSBwYXN0YQpEdWUgdGF6emUgZGkgYnJvZG8gZGkgbWFuem8KVW5hIHRhenphIGRpIGZvcm1hZ2dpbyBncmF0dHVnZ2lhdG8=', 'VGFnbGlhcmUgbGEgY2lwb2xsYSBhIGRhZGluaSBlIHRyaXRhcmUgbCdhZ2xpby4gQ3VjaW5hcmxpIGluIHVuYSBwZW50b2xhIGxhcmdhIGNvbiBvbGlvIGQnb2xpdmEgYSBmdW9jbyBtZWRpbyBmaW5vIGEgcXVhbmRvIG5vbiBzb25vIG1vcmJpZGUgZSB0cmFzcGFyZW50aS4KQWdnaXVuZ2VyZSBpbCBtYW56byBtYWNpbmF0byBlIGN1Y2luYXJlIGZpbm8gYWxsYSBkb3JhdHVyYS4gU2UgbGEgY2FybmUgw6ggZ3Jhc3NhIHRvZ2xpZXJlIGlsIGdyYXNzbyBpbiBlY2Nlc3NvIGFsbGEgZmluZS4KQWdnaXVuZ2VyZSBsYSBmYXJpbmEgZSBsYSBwb2x2ZXJlIGRpIHBlcGVyb25jaW5vLCBtZXNjb2xhbmRvIGZpbm8gYSByaWNvcHJpcmUgbGEgY2FybmUuIEJpc29nbmEgZmFyZSBhdHRlbnppb25lIGEgbm9uIGJydWNpYXJsaSBzdWwgZm9uZG8gZGVsbGEgcGVudG9sYS4KU2NpYWNxdWFyZSBlIHNnb2NjaW9sYXJlIGkgZmFnaW9saQpVbmlyZSBpIGZhZ2lvbGksIGkgcG9tb2RvcmkgdGFnbGlhdGkgYSBkYWRpbmksIGxhIHBhc3NhdGEgZGkgcG9tb2Rvcm8gZSBpIGNoaWNjaGkgZGkgbWFpcy4gTWVzY29sYXJlIGJlbmUgcGVyIHRvZ2xpZXJlIGxhIGZhcmluYSBlIGxhIHBvbHZlcmUgZGkgcGVwZXJvbmNpbm8gZGFsIGZvbmRvIGRlbGxhIHBlbnRvbGEuCkFnZ2l1bmdlcmUgbGEgcGFzdGEgZSBsZSBkdWUgdGF6emUgZGkgYnJvZG8gZSBtZXNjb2xhcmUgZmlubyBhZCBhbWFsZ2FtYXJlCkNvcHJpcmUgY29uIHVuIGNvcGVyY2hpbywgYWx6YXJlIGlsIGZ1b2NvIGUgYXNwZXR0YXJlIGNoZSBhcnJpdmkgYWQgZWJib2xsaXppb25lLgpVbmEgdm9sdGEgcmFnZ2l1bnRhIGwnZWJib2xsaXppb25lIG1lc2NvbGFyZSBlIGZhcmUgYXR0ZW56aW9uZSBhIHRvZ2xpZXJlIGV2ZW50dWFsaSBwZXp6aSBkaSBwYXN0YSByaW1hc3RpIGF0dGFjY2F0aSBhbCBmb25kbyBkZWxsYSBwZW50b2xhLiBBYmJhc3NhcmUgaWwgZnVvY28gYSBtZWRpby1iYXNzbwpMYXNjaWFyIGN1Y2luYXJlIGEgZnVvY28gYmFzc28gcGVyIDE1IG1pbnV0aSBjaXJjYSwgbWVzY29sYW5kbyBkaSB0YW50byBpbiB0YW50byBwZXIgbm9uIGZhciBhdHRhY2NhcmUgbGEgcGFzdGEgYWxsYSBwZW50b2xhLiBJbnRlcnJvbXBlcmUgcHJpbWEgbGEgY290dHVyYSBzZSBsYSBwYXN0YSBhc3NvcmJlIGxhIG1hZ2dpb3IgcGFydGUgZGVsIGxpcXVpZG8KQWdnaXVuZ2VyZSBpbCBmb3JtYWdnaW8gZSBtZXNjb2xhcmUgZmlubyBhIHF1bmFkbyBub24gc2kgc2Npb2dsaWUgZSBmb3JtYSB1bmEgY3JlbWluYS4gRGEgc2VydmlyZSBjYWxkbw==', 'SSBtYWNjaGVyb25pIHNvbm8gaWwgdGlwbyBkaSBwYXN0YSBwacO5IGFkYXR0byBhIHF1ZXN0YSByaWNldHRhLCBhbmNoZSBzZSBub24gw6ggbmVjZXNzYXJpbyB1c2FybGksIHVuIGdlbmVyaWNvIHRpcG8gZGkgcGFzdGEgdmEgYmVuZS4=', 'NSBwZXJzb25l'),
(2, 'Q29zY2UgZGkgcG9sbG8gYWwgZm9ybm8=', 'VHV0dG8gaWwgZ3VzdG8gZGVsbGUgY29zY2UgZGkgcG9sbG8gY29tYmluYXRvIGNvbiBsYSBjdWNpbmEgYWwgZm9ybm8sIHBlciB1biBwYXN0byBzYWx1dGFyZSBlIHJpY2NvIGRpIHByb3RlaW5lLg==', 'aW1hZ2VzL2Nvc2NlUG9sbG8uanBn', 'Q29zY2UgZGkgcG9sbG8gY29uIHBlbGxlIGUgY29uIHF1YWxjaGUgZmV0dGEgZGkgbGltb25lIGFuY29yYSBuZWxsYSB0ZWdsaWEgaW4gY3VpIHNvbm8gc3RhdGUgY3VjaW5hdGU=', 'NCB0YXp6ZSBkaSBhY3F1YQo0IGJ1c3RpbmUgZGkgdGhlIG5lcm8KMyBmZXR0aW5lIGRpIHNjb3J6YSBkaSBsaW1vbmUKMiBjdWNjaGlhaSBkaSBzdWNjbyBkaSBsaW1vbmUKU2FsZQpadWNjaGVybwoxa2cgY2lyY2EgZGkgY29zY2UgZGkgcG9sbG8gKGNvbiBvc3NhIGUgcGVsbGUpCk9saW8gZGkgb2xpdmEKUGVwZSBuZXJvCjEgbGltb25lIHRhZ2xpYXRvIGZpbm8KMSBjdWNjaGlhaW8gZGkgbWllbGU=', 'UG9ydGFyZSB1biBwZW50b2xpbm8gZGkgYWNxdWEgYWQgZWJvbGxpemlvbmUuIFVuYSB2b2x0YSBmYXR0byBhZ2dpdW5nZXJlIGxlIGJ1c3RpbmUgZGkgdGhlIGUgbGUgc2NvcnplIGRpIGxpbW9uZSBlIGxhc2NpYXIgcmlwb3NhcmUgcGVyIDEwIG1pbnV0aS4KUmltdW92ZXJlIGxlIGJ1c3RpbmUsIGFnZ2l1bmdlcmUgc2FsZSBlIHp1Y2NoZXJvLCBtZXNjb2xhcmUgZSBsYXNjaWFyIHJhZmZyZWZmYXJlIGZpbm8gYSB0ZW1wZXJhdHVyYSBhbWJpZW50ZS4KUmlwb3JyZSBsZSBjb3NjZSBkaSBwb2xsbyBjb24gaWwgdGhlIGluIHVuYSBib3JzYSBjb24gemlwIGUgcmVmcmlnZXJhcmUgcGVyIDMtNCBvcmUKUHJlcmlzY2FsZGFyZSBpbCBmb3JubyBhIDIzMMKwQwpSaW11b3ZlcmUgaWwgcG9sbG8gZGFsbGEgYm9yc2EgZSBhc2NpdWdhcmxvClNjYWxkYXJlIHVuIGN1Y2NoaWFpbyBkaSBvbGlvIGluIHVuYSBwZW50b2xhIHBlciBmb3JubyBlIHF1YW5kbyDDqCBjYWxkbyBhZ2dpdW5nZXJlIGlsIHBvbGxvIGNvbiBsYSBwZWxsZSB2ZXJzbyBpbCBiYXNzby4gQ3VjaW5hcmUgZmlubyBhIHF1YW5kbyBsYSBwZWxsZSBpbml6aWEgYSBkb3JhcmUuCkdpcmFyZSBpbCBwb2xsbyBjb24gYXR0ZW56aW9uZSwgbWV0dGVyZSBsZSBmZXR0ZSBkaSBsaW1vbmUgc3VsIHBvbGxvIGUgbWV0dGVyZSB1biBwYWlvIGRpIGZldHRlIGFuY2hlIHNvdHRvIGlsIHBvbGxvLiBDdWNpbmFyZSBwZXIgMTAtMTIgbWludXRpCkNvc3BhcmdlcmUgbGEgcGVsbGUgY29uIGlsIG1pZWxlIGUgY3VjaW5hcmUgcGVyIGFsdHJpIDEtMiBtaW51dGk=', 'TmVzc3VuIGNvbnNpZ2xpby4=', 'NC02IHBlcnNvbmU='),
(3, 'Q29zdG9sZXR0ZSBkaSBhZ25lbGxv', 'VW5hIHJpY2V0dGEgcGnDuSByaWNlcmNhdGEgY2hlLCBhYmJpbmF0YSBhIHVuJ2luc2FsYXRhLCBzYXLDoCB1biBvdHRpbWEgZnVnYSBkYWxsYSByb3V0aW5lLg==', 'aW1hZ2VzL2FnbmVsbG8uanBn', 'Q29zdG9sZXR0ZSBkaSBhZ25lbGxvIHNlcnZpdGUgc3UgdW4gbGV0dG8gZGkgY2Fyb3Rl', 'VW5hIGNvc3RhdGEgZGkgYWduZWxsbyAoY2lyY2EgNzAwZyksIHRhZ2xpYXRhIGUgcHVsaXRhIGRhbCBncmFzc28KU2FsZSBlIHBlcGUKNDUwZyBkaSBjYXJvdGUKMiBjdWNjaGlhaSBkaSBtb3N0YXJkYQoyIGN1Y2NoaWFpIGRpIG9saW8gZXh0cmF2ZXJnaW5lIGRpIG9saXZhCjIgY3VjY2hpYWkgZGkgY29yaWFuZG9sbyB0cml0YXRvIGZpbmVtZW50ZQoyIGN1Y2NoaWFpIGRpIHNjYWxvZ25vIHRyaXRhdG8KMiBjdWNjaGlhaSBkaSBhY2V0byBkaSB2aW5vIHJvc3NvClVuIGN1Y2NoaWFpbyBkaSBidWNjaWEgZCdhcmFuY2lhIHNjaW9sdGE=', 'U2NhbGRhcmUgdW5hIGNhc3NlcnVvbGEgYSBmdW9jbyBtZWRpby1hbHRvClNwZXppYXJlIGwnYWduZWxsbyBhIHBpYWNlcmUsIHNjb3R0YXJsbyBlIGN1Y2luYXJsbyBwZXIgY2lyY2EgMiBtaW51dGkgcGVyIG9nbmkgcGFydGUKR3JhdHR1Z2lhcmUgbGUgY2Fyb3RlIGFiYmFzdGFuemEgZ3Jvc3NlCkluIHVuYSBjaW90b2xhIG1lc2NvbGFyZSBsYSBtb3N0YXJkYSwgbCdvbGlvLCBpbCBjb3JpYW5kb2xvLCBsbyBzY2Fsb2dubywgbCdhY2V0byBlIGxhIGJ1Y2NpYSBkJ2FyYW5jaWEuIFVuaXJlIGxlIGNhcm90ZSBhbGxhIGZpbmUgZSBzY3VvdGVyZSBmaW5vIGEgcXVhbmRvIGxlIGNhcm90ZSBzb25vIGNvcGVydGUuIFBlcGFyZSBhIHBpYWNlcmUKTGFzY2lhciBtYXJpbmFyZSBwZXIgMTAgbWludXRpIGUgc2VydmlyZSBjb24gbCdhZ25lbGxv', 'TmVzc3VuIGNvbnNpZ2xpby4=', 'MiBwZXJzb25l'),
(4, 'UG9sbG8gQXNoYXRp', 'VW4gcGlhdHRvIGFmcmljYW5vIGEgYmFzZSBkaSBwb2xsbyBlIHJpc28sIGFsaW1lbnRpIHNhbHV0YXJpIHBlciBjaGl1bnF1ZSBlIGNoZSBhaXV0YW5vIGNoaSB2dW9sZSBhbGxlbmFyc2k=', 'aW1hZ2VzL3BvbGxvUmlwaWVuby5qcGc=', 'UG9sbG8gY3VjaW5hdG8sIGNvbiBsYSBwZWxsZSBicnVjaWFjY2hpYXRhLCBzZXJ2aXRvIHN1IHVuIHBpYXR0byBhbGx1bmdhdG8gY29uIGRlZ2xpIGFzcGFyYWdp', 'VW4gY3VjY2hpYWlvIGRpIHRpbW8KVW4gY3VjY2hpYWlubyBhYmJvbmRhbnRlIGRpIHNhbGUKVW4gY3VjY2hpYWlvIGUgbWV6em8gZGkgcG9sdmVyZSBkaSBjaXBvbGxhClVuIGN1Y2NoaWFpbyBlIG1lenpvIGRpIHBvbHZlcmUgZGkgYWdsaW8KVW4gY3VjY2hpYWlubyBkaSBwYXByaWthIGFmZnVtaWNhdGEKVW4gY3VjY2hpYWlubyBkaSBwZXBlIGJpYW5jbwpNZXp6byBjdWNjaGlhaW5vIGRpIHBlcGUgZGkgQ2F5ZW5uZQoxIGNpcG9sbGEgbWVkaWEgdHJpdGF0YQo0MDBnIGRpIHBhc3NhdGEgZGkgcG9tb2Rvcm8KTWV6emEgdGF6emEgZGkgb2xpbyBkYSBjdWNpbmEKMyB0YXp6ZSBkaSByaXNvCjIgY3VjY2hpYWluaSBkaSBicm9kbyBkaSBwb2xsbwoyIGN1Y2NoaWFpbmkgZGkgc2FsZQpVbiBjdWNjaGlhaW5vIGRpIHBhcHJpa2EKVW4gY3VjY2hpYWlvIGRpIHBvbHZlcmUgZGkgYWdsaW8KMyB0YXp6ZSBlIG1lenphIGRpIGFjcXVhIG8gYnJvZG8gZGkgcG9sbG8KVW4gY3VjY2hpYWlubyBkaSBwZXBlIGJpYW5jbwpPcHppb25hbGU6IG1lenpvIGN1Y2NoaWFpbm8gZGkgdGltbyBlc3NpY2NhdG8KVW4gY3VjY2hpYWlubyBzY2Fyc28gZGkgcGVwZSBwaWNjYW50ZQo0NTBnIGRpIHZlcmR1cmEKVW4gcXVhcnRvIGRpIHRhenphIGRpIGdyYXNzbyBzY2lvbHRvIGRpIHBvbGxvCjItMyBjdWNjaGlhaSBkaSBmYXJpbmEKMiBvIHBpw7kgdGF6emUgZGkgYnJvZG8gZGkgcG9sbG8KU2FsZSBlIHBlcGUgbmVybyBtYWNpbmF0byBhIHBpYWNlcmU=', 'UHJlcmlzY2FsZGFyZSBpbCBmb3JubyBhIDE4MMKwIGUgcmlzY2lhY3F1YXJlIGlsIHJpc28KSW4gdW5hIHRlZ2xpYSBkYSBmb3JubyBhIG1lenphIHNmb2dsaWEgbWVzY29sYXJlIHR1dHRpIGdsaSBpbmdyZWRpZW50aSBlIGNvcHJpcmUgYmVuZSBjb24gdW4gZm9nbGlvIGRpIGFsbHVtaW5pbwpNZXR0ZXJlIGluIGZvcm5vIGUgZmFyIGN1Y2luYXJlIHBlciBjaXJjYSB1bidvcmEKVW5hIHZvbHRhIGZpbml0byByaW11b3ZlcmUgZGFsIGZvcm5vIGUgZmFyIHJhZmZyZWRkYXJlIHBlciA1IG1pbnV0aSwgcG9pIHJpbXVvdmVyZSBsJ2FsbHVtaW5pby4KTWVzY29sYXJlIGlsIHJpc28gY29uIHVuYSBmb3JjaGV0dGEgZSBtZXNjb2xhcmUgZXF1YW1lbnRlCkRpc29zc2FyZSBpbCBwb2xsbyBlIGFzY2l1Z2FybG8uIFRlbmVyZSBkYSBwYXJ0ZSBsZSBvc3NhClNwZXppYXJlIGFiYm9uZGFudGVtZW50ZSBpbCBwb2xsbwpGYXJjaXJlIGlsIHBvbGxvIGNvbiBpbCByaXNvLiBTaSBwdcOyIGN1Y2lyZSBvIGxlZ2FyZS4KTGVnYXJlIGxlIGVzdHJlbWl0w6AgbGliZXJlIGRlbCBwb2xsbyBzb3R0byBpbCBwb2xsbyBzdGVzc28KVW5hIHZvbHRhIGxlZ2F0byBiZW5lLCBjb25kaXJlIGFiYm9uZGFudGVtZW50ZSBpbCBwb2xsbwpSaXNjYWxkYXJlIGlsIGZvcm5vIGEgMTkwwrAKTWV0dGVyZSBpbCBwb2xsbyBpbiB1bmEgdGVnbGlhIGUgYXJyb3N0aXJlIHBlciA1MCBtaW51dGksIHBvaSBzY29wcmlyZSBlIGN1Y2luYXJlIHBlciBhbHRyaSAyMC0zMCBtaW51dGkuClNjYWxkYXJlIHVuYSBjYXNzZXJ1b2xhIGNvbiBpbCBncmFzc28gYSBmdW9jbyBtZWRpby1hbHRvLgpVbmlyZSBsYSBmYXJpbmEgZSBhbWFsZ2FtYXJlLgpNZXNjb2xhcmUgcGVyIDEtMiBtaW51dGkuCkFnZ2l1bmdlcmUgZ3JhZHVhbG1lbnRlIHVuIHF1YXJ0byBkZWxsJ2FjcXVhLCBjb250aW51YW5kbyBhIG1lc2NvbGFyZSBmaW5vIGEgcXVhbmRvIGxhIG1pc2NlbGEgZGl2ZW50YSBsaXNjaWEKQWdnaXVuZ2VyZSBsJ2FjcXVhIHBlciBjYW1iaWFyZSBsYSBjb25zaXN0ZW56YSBhIHBpYWNlcmUuIENvbmRpcmUgY29uIHNhbGUsIHBlcGUgZSBicm9kbyBkaSBwb2xsby4=', 'TmVzc3VuIGNvbnNpZ2xpby4=', 'NSBwZXJzb25l'),
(5, 'UGFuIGQnYXJhbmNpbyBsaWdodA==', 'VW5hIHJpY2V0dGEgdmVsb2NlIHBlciB1biBkb2xjZSBzZml6aW9zbyBlIGFsbG8gc3Rlc3NvIHRlbXBvIGxpZ2h0LCBwZXJmZXR0byBwZXIgY2hpIGhhIHZvZ2xpYSBkaSB1biBkb2xjZSBtYSB2dW9sZSBhbmNoZSByaW1hbmVyZSBpbiBmb3JtYS4=', 'aW1hZ2VzL3BhbkFyYW5jaW8uanBn', 'VG9ydGEgYSBiYXNlIGNpcmNvbGFyZSwgcmljb3BlcnRhIGRpIG1pZWxlIGRhIGN1aSDDqCBzdGF0YSB0YWdsaWF0YSB1bmEgZmV0dGEgZSBwb3N0YSBzdSB1biBwaWF0dG8gaW4gcHJpbW8gcGlhbm8=', 'MiB1b3ZhCjEwMGcgZGkgZmFyaW5hCjEwMGcgZGkgeW9ndXJ0IGdyZWNvCjQwZyBkaSBtaWVsZSAobyBzdGV2aWEpCjEgYnVzdGluYSBkaSBsaWV2aXRvCjEgYXJhbmNpYSBpbnRlcmEgY29uIGJ1Y2NpYQ==', 'U2JhdHRlcmUgYXNzaWVtZSBsZSB1b3ZhIGUgbGEgc3RldmlhLiBJbiBjYXNvIHNpIHVzaSBpbCBtaWVsZSwgaW52ZWNlLCBzYmF0dGVyZSBzb2xvIGxlIHVvdmEuCkFtYWxnYW1hcmUgZ2xpIGFsdHJpIGluZ3JlZGllbnRpIHVubyBhbGxhIHZvbHRhIChjb21wcmVzbyBpbCBtaWVsZSBzZSBzaSDDqCBkZWNpc28gZGkgdXNhcmUgcXVlbGxvIGNvbWUgZG9sY2lmaWNhbnRlKQpQYXNzYWdnaW8gb3B6aW9uYWxlOiB0YWdsaWFyZSBsJ2FyYW5jaWEgZSB0b2dsaWVyZSBpIHNlbWkKRnJ1bGxhcmUgbCdpbnRlcmEgYXJhbmNpYSwgYnVjY2lhIGNvbXByZXNhClVuaXJlIGxhIHB1cmVhIGQnYXJhbmNpYSByaXN1bHRhbnRlIGFsbCdpbXBhc3RvCkN1Y2luYXJlIGluIGZvcm5vIGEgMTgwwrAgcGVyIDM1IG1pbnV0aSBjaXJjYQ==', 'TmVzc3VuIGNvbnNpZ2xpby4=', 'MTAtMTIgZmV0dGU='),
(6, 'VG9ydGEgYWwgcGlzdGFjY2hpbyBsZWdnZXJh', 'VHV0dG8gaWwgZ3VzdG8gZGVsbGEgdG9ydGEgYWwgcGlzdGFjY2hpbyBzZW56YSBsZSBjYWxvcmllIGRpIHVuYSB0b3J0YSwgbm9uIGMnw6ggbW9kbyBtaWdsaW9yZSBkaSB0b2dsaWVyc2kgdW5vIHNmaXppbyBzZW56YSBjb21wcm9tZXR0ZXJlIGxhIGxpbmVhLg==', 'aW1hZ2VzL3RvcnRhUGlzdGFjY2hpby5qcGc=', 'VG9ydGEgYSBiYXNlIGNpcmNvbGFyZSByaWNvcGVydGEgZGkgZ3JhbmVsbGxhIGRpIHBpc3RhY2NoaSBkYSBjdWkgbWFuY2EgdW5hIGZldHRh', 'NjBnIGRpIGFsYnVtZSBkJ3Vvdm8KMTIwZyBkaSBmYXJpbmEKMjAwZyBkaSB5b2d1cnQgZ3JlY28gYWwgcGlzdGFjY2hpbwo3MGcgZGkgbGF0dGUgc2NyZW1hdG8KOGcgYnVzdGluYSBkaSBsaWV2aXRvCjMwZyBkaSBwaXN0YWNjaGkgdHJpdGF0aQ==', 'TW9udGFyZSBsJ2FsYnVtZSBkJ3Vvdm8uCkFtYWxnYW1hcmUgZ2xpIGFsdHJpIGluZ3JlZGllbnRpIHVuIHBvJyBhbGxhIHZvbHRhIHRlbmVuZG8gZGEgcGFydGUgYWxjdW5pIGRlaSBwaXN0YWNjaGkuCkN1Y2luYXJlIGluIGZvcm5vIGEgMTgwwrAgcGVyIDIwIG1pbnV0aQ==', 'TmVzc3VuIGNvbnNpZ2xpby4=', 'OCBmZXR0ZQ==');

-- --------------------------------------------------------

--
-- Struttura della tabella `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `IDPost` int(11) UNSIGNED NOT NULL,
  `IDUtente` varchar(150) NOT NULL,
  PRIMARY KEY (`IDPost`,`IDUtente`),
  KEY `LIKES_ibfk_2` (`IDUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `likes`
--

INSERT INTO `likes` (`IDPost`, `IDUtente`) VALUES
(1, 'RW1tYVJvdmVyb25p');

-- --------------------------------------------------------

--
-- Struttura della tabella `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Alimentazione','Workout','Sito') NOT NULL,
  `Titolo` varchar(150) NOT NULL,
  `Testo` text NOT NULL,
  `Link` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `news`
--

INSERT INTO `news` (`ID`, `Tipo`, `Titolo`, `Testo`, `Link`) VALUES
(12, 'Workout', 'YQ==', 'YQ==', 'https://en.wikipedia.org/wiki/92nd_Academy_Awards'),
(235, 'Alimentazione', 'bQ==', 'bQ==', NULL),
(236, 'Workout', 'aw==', 'aw==', 'https://mail.google.com/mail/u/1/#inbox'),
(239, 'Alimentazione', 'YW5hdHJh', 'YW5hdHJh', 'https://en.wikipedia.org/wiki/Anatra'),
(240, 'Workout', 'c3Nzcw==', 'c3Nzcw==', ''),
(241, 'Sito', 'ZGRk', 'ZGRk', ''),
(242, 'Alimentazione', 'bW9vZGxl', 'bW9vZGxl', 'https://elearning.unipd.it/math/course/index.php?categoryid=39');

-- --------------------------------------------------------

--
-- Struttura della tabella `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `IDPost` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `IDUtente` varchar(150) NOT NULL,
  `numeroLike` int(11) NOT NULL,
  `Testo` text NOT NULL,
  PRIMARY KEY (`IDPost`),
  KEY `IDUtente` (`IDUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `post`
--

INSERT INTO `post` (`IDPost`, `IDUtente`, `numeroLike`, `Testo`) VALUES
(1, 'TWFyY29Eag==', 0, 'Q2lhbyBhIHR1dHRpIQpIbyBwcm92YXRvIGEgY3VjaW5hcmUgbGEgdG9ydGEgYWwgcGlzdGFjY2hpbyBsZWdnZXJhIG1hIGhvIHJpc2NvbnRyYXRvIGFsY3VuZSBkaWZmaWNvbHRhIGNvbiBsYSBwcmVwYXJhemlvbmUuLi4KUXVhbGN1bm8gcHXDsiBhaXV0YXJtaT8/CkdyYXppZWVlIDop'),
(2, 'U2FtdWVsSw==', 0, 'SG8gc2VndWl0byBpIGNvbnNpZ2xpIGRlZ2xpIGFsbGVuYW1lbnRpIHByb3Bvc3RpLiBIbyBzcGVyaW1lbnRhdG8gaWwgYnJvIHNwbGl0IGUgaSByaXN1bGF0YXRpIGluaXppYW5vIGEgZmFyc2kgdmVkZXJl');

-- --------------------------------------------------------

--
-- Struttura della tabella `risposta`
--

DROP TABLE IF EXISTS `risposta`;
CREATE TABLE IF NOT EXISTS `risposta` (
  `IDRisposta` int(11) NOT NULL AUTO_INCREMENT,
  `IDutente` varchar(150) NOT NULL,
  `Testo` text NOT NULL,
  `IDPost` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`IDRisposta`),
  KEY `IDPost` (`IDPost`),
  KEY `IDutente` (`IDutente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `risposta`
--

INSERT INTO `risposta` (`IDRisposta`, `IDutente`, `Testo`, `IDPost`) VALUES
(1, 'U2FtdWVsSw==', 'Q2lhb29vVGkgY29uc2lnbGlvIGRpIG1ldHRlcmUgcHJpbWEgbCdhbGJ1bWUgZSBsYSBmYXJpbmEgZSBkb3BvIGFnZ2l1bmdlcmUgYW5jaGUgaWwgcmVzdG8gZGVnbGkgaW5ncmVkaWVudGkhRmFjY2kgc2FwZXJlIWNpYW9vbyA6KQ==', 1),
(4, 'Q2lhbw==', 'ZGZnaGprbMOy', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

DROP TABLE IF EXISTS `utente`;
CREATE TABLE IF NOT EXISTS `utente` (
  `IDUtente` varchar(150) NOT NULL,
  `Nome` varchar(150) NOT NULL,
  `Cognome` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` text NOT NULL,
  `Amministratore` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`IDUtente`, `Nome`, `Cognome`, `Email`, `Password`, `Amministratore`) VALUES
('Q2lhbw==', 'Y2lhbw==', 'Y2lhbw==', 'Y2lhbw==', 'a0c299b71a9e59d5ebb07917e70601a3570aa103e99a7bb65a58e780ec9077b1902d1dedb31b1457beda595fe4d71d779b6ca9cad476266cc07590e31d84b206', 0),
('RW1tYVJvdmVyb25p', 'RW1tYQ==', 'Um92ZXJvbmk=', 'RW1tYVJvdmVAZ21haWwuY29t', '4c805fb46914992490f05b904e30b2a3840ad5dd48336b21addd503474866a11ab2ce1147f4b1c51de3d35bcd28a55c09054b7953887c66e014fddba9cdb2944', 1),
('TWFyY29Eag==', 'TWFyY28=', 'VWRlcnpv', 'TWFyY29VZEBnbWFpbC5jb20=', '11c724908c020116ef6776ee0c627f7d8df5bc9caf4face309f0486ed7e6205c404a8b2c4548753787a917edd8b5e63c136557ee047c3fad859aecdc15c58dfa', 0),
('TWFyY29UZXNzZXI=', 'TWFyY28=', 'VGVzc2Vy', 'TWFyY29UOVRAZ21haWwuY29t', '7350746c2106c01ec4b85b75fc5d9e9d32e1103667bd11fe45b5d983a8ba12bf7a6d2f14ec6a92de176cdfe90bb4bc6e9efcd5ea37316af5d3b52033172bc041', 1),
('U2FtdWVsSw==', 'U2FtdWVs', 'S29zdGFkaW5vdg==', 'ZGVyS29zdGFAZ21haWwuY29t', '3330e27b41e71af747cb6bde4ac8078d4d7339f30309fe4578263f1a750cb68168d5f1fc8c2e275d338e7bbf9520a8c5f9019eb8ac3e93e3a5b4012599df7f56', 0);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `LIKES_ibfk_1` FOREIGN KEY (`IDPost`) REFERENCES `post` (`IDPost`),
  ADD CONSTRAINT `LIKES_ibfk_2` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`IDUtente`);

--
-- Limiti per la tabella `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `POST_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`IDUtente`);

--
-- Limiti per la tabella `risposta`
--
ALTER TABLE `risposta`
  ADD CONSTRAINT `RISPOSTA_ibfk_1` FOREIGN KEY (`IDPost`) REFERENCES `post` (`IDPost`),
  ADD CONSTRAINT `RISPOSTA_ibfk_2` FOREIGN KEY (`IDutente`) REFERENCES `utente` (`IDUtente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
