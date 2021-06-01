-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2021 at 08:30 AM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `alimentazione`
--

CREATE TABLE `alimentazione` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Nome` varchar(150) NOT NULL,
  `Descrizione` text NOT NULL,
  `NomeImmagine` varchar(150) NOT NULL,
  `AltImmagine` text NOT NULL,
  `Ingredienti` text NOT NULL,
  `Procedimento` text NOT NULL,
  `Consigli` text NOT NULL,
  `Persone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alimentazione`
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
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `IDPost` int(11) UNSIGNED NOT NULL,
  `IDUtente` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`IDPost`, `IDUtente`) VALUES
(49, 'RW1tYVJvdmVyb25p'),
(49, 'TWFyY29VZGVyem8='),
(49, 'U2FtdWVsS29zdGFkaW5vdg=='),
(49, 'YWRtaW4='),
(50, 'RW1tYVJvdmVyb25p'),
(50, 'U2FtdWVsS29zdGFkaW5vdg=='),
(51, 'RW1tYVJvdmVyb25p'),
(51, 'YWRtaW4='),
(52, 'RW1tYVJvdmVyb25p'),
(52, 'TWFyY29VZGVyem8='),
(52, 'U2FtdWVsS29zdGFkaW5vdg=='),
(52, 'YWRtaW4='),
(54, 'YWRtaW4=');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Tipo` enum('Alimentazione','Workout','Sito') NOT NULL,
  `Titolo` varchar(150) NOT NULL,
  `Testo` text NOT NULL,
  `Link` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`ID`, `Tipo`, `Titolo`, `Testo`, `Link`) VALUES
(253, 'Sito', 'TWFudXRlbnppb25lIHNpdG8=', 'Q2lhbyBhIHR1dHRpISBWb2xldmFtbyBhdnZpc2FyZSBjaGUgaWwgc2l0byBzYXLDoCBmdW9yaSBzZXJ2aXppbyBkYWxsZSAxMjowMCBhbGxlIDEzOjAwIGRpIG1hcnRlZMOsIDEgZ2l1Z25vIHBlciB1bmEgbWFudXRlbnppb25lIHN0cmFvcmRpbmFyaWEuIENpIHNjdXNpYW1vIHBlciBpbCBkaXNhZ2lvLg==', NULL),
(254, 'Alimentazione', 'UmlzbyBjb24gZ2FtYmVyZXR0aSBlIHp1Y2NoaW5l', 'Q2lhbyByYWdhenppISBPZ2dpIHZvbGV2YW1vIGNvbmRpdmlkZXJ2aSBxdWVzdGEgcmljZXR0YSBjaGUgYWJiaWFtbyB0cm92YXRvIHN1bCBzaXRvIGRlaSBub3N0cmkgYW1pY2kgZGkgR2lhbGxvWmFmZmVyYW5vISBMYSByaWNldHRhIGNvbnNpc3RlIGluIHVuIHJpc28gdmVuZXJlIGNvbiBnYW1iZXJldHRpIGUgenVjY2hpbmUsIHNxdWlzaXRvIGUgYWxsbyBzdGVzc28gdGVtcG8gb3R0aW1vIHBlciBjaGkgw6ggaW4gZGlldGEhIA==', 'https://ricette.giallozafferano.it/Riso-Venere-con-gamberetti-e-zucchine.html'),
(255, 'Workout', 'U2NvbnRvIHByb3RlaW5lIEJ1bGsgUG93ZGVy', 'Q2lhbyByYWdhenppISBWb2xldmFtbyBhdnZpc2FydmkgY2hlIGkgbm9zdHJpIGFtaWNpIGRpIEJ1bGtQb3dkZXJzIHN0YW5ubyBmYWNlbmRvIHVubyBzY29udG8gc3UgdHV0dGEgbGEgbG9ybyBzZXppb25lIHByb3RlaW5lLCBxdWluZGkgc2Ugc2lldGUgaW50ZXJlc3NhdGkgYXBwcm9maXR0YXRlbmUgb3JhIQ==', 'https://www.bulk.com/it/proteine.html'),
(256, 'Workout', 'UGFuY2EgU2NvdHQ=', 'Q2lhbyByYWdhenppISBPZ2dpIHZvbGV2YW1vIGNvbmRpdmlkZXJ2aSBxdWVzdG8gZXNlcmNpemlvIGNvbiBsJ3V0aWxpenpvIGRlbGxhIFBhbmNhIFNjb3R0IGNoZSBhYmJpYW1vIHRyb3ZhdG8gc3UgWW91VHViZSEgU3BlcmlhbW8gcG9zc2EgZXNzZXJ2aSB1dGlsaSBwZXIgaSB2b3N0cmkgd29ya291dCE=', 'https://www.youtube.com/watch?v=2eHd_qBndYw'),
(257, 'Alimentazione', 'UGFzdGEgYWwgY2hpbGk=', 'Q2lhbyBSYWdhenppISBWb2xldmFtbyBhdnZpc2FydmkgY2hlIHRyYSBwb2NvIHB1YmJsaWNoZXJlbW8gc3VsIHNpdG8gdW5hIG51b3ZhIHJpY2V0dGEgcGVyIGxhIFBhc3RhIGFsIENoaWxpISBRdWluZGkgY29udHJvbGxhdGUgbGEgcGFnaW5hIGFsaW1lbnRhemlvbmUgaW4gcXVlc3RpIGdpb3JuaSE=', NULL),
(259, 'Sito', 'QWdnaW9ybmFtZW50byBpbnRlcmZhY2NpYQ==', 'Q2lhbyBSYWdhenppISBWb2xldmFtbyBhdnZpc2FydmkgY2hlIHRyYSBxdWFsY2hlIGdpb3JubyBjaSBzYXLDoCB1biBhZ2dpb3JuYW1lbnRvIGRlbGwnaW50ZXJmYWNjaWEgZ3JhZmljYSBkZWwgc2l0by4gU3BlcmlhbW8gdmkgcGlhY2NpYS4gQ2lhbyEg', NULL),
(260, 'Workout', 'TGEgTW9udGFnbmEgaGEgc3RhY2NhdG8gNTAxa2chIA==', 'SWwgJSVyZWNvcmQlJSBkaSBzdGFjY28gZGEgdGVycmEgKDUwMGtnKSwgZGVudGVudXRvIGRhICUlRWRkaWUgSGFsbCUlIGRhbCAyMDE2LCDDqCBzdGF0byBvZ2dpIHN1cGVyYXRvIGRhIEhhZnRob3IgSnVsaXVzICJUaG9yIiBCam9ybnNzb24sIGNvbm9zY2l1dG8gYW5jaGUgY29tZSAiTGEgTW9udGFnbmEiIGRpICUlR2FtZSBvZiBUaHJvbmVzJSUuIFJpY29yZGlhbW8gY2hlIHRyYSBpIGR1ZSBhdGxldGkgbm9uIHNjb3JyZSBidW9uIHNhbmd1ZSwgZSwgcHVyIHBvdGVuZG8gc3RhY2NhcmUgbW9sdG8gZGkgcGnDuSwgVGhvciBoYSB2b2x1dG8gYmF0dGVyZSBpbCBzdW8gcml2YWxlIHNvbGxldmFuZG8gdW4gc29sbyBrZyBpbiBwacO5IHJpc3BldHRvIGFsIHJlY29yZCBkaSAlJUVkZGllJSUuICg1MDFrZyku', 'https://www.youtube.com/watch?v=2kEC7X1FUIg'),
(261, 'Workout', 'JSVDaHJpcyBCdW1zdGVhZCUlIMOoIGlsIG51b3ZvICUlQ2xhc3NpYyBQaHlzaXF1ZSUl', 'JSVDaHJpcyBCdW1zdGVhZCUlIMOoIGlsIG51b3ZvICUlTXIuIE9seW1waWElJSBkZWxsYSBkaXZpc2lvbmUgJSVDbGFzc2ljIFBoeXNpcXVlJSUuIEdpw6AgZHVyYW50ZSBsYSAlJVByZXNzIENvbmZlcmVuY2UlJSBsYSB0ZW5zaW9uZSB0cmEgbCdhdGxldGEgY2FuYWRlc2UgZSBpbCBjb250ZW5kZW50ZSAlJUJyZW9uIEFuc2xleSUlIGVyYSBwYWxwYWJpbGUuIEkgZHVlLCBjb21lIGRhIHRyYWRpemlvbmUsIGhhbm5vIHRlbnV0byB1biBkaWJhdHRpdG8gc3UgY2hpIGRvdmVzc2UgdmluY2VyZS4gJSVCcmVvbiUlLCBpbmZhdHRpLCBoYSBzb3N0ZW51dG8gZGkgZXNzZXJlIGlsICUlYm9keWJ1aWxkZXIlJSBwacO5IGNvbXBsZXRvLiBMYSByaXNwb3N0YSBkaSAlJUNocmlzJSUgw6ggc3RhdGEgdGFudG8gc2lsZW56aW9zYSBxdWFudG8gdGFnbGllbnRlLiBJbmZhdHRpLCBkYWwgc3VvIHNndWFyZG8gc2ljdXJvIHRyYXNwYXJpdmEgdW5hIGZlcm1hIGNvbnZpbnppb25lOiAlJUNsYXNzaWMgUGh5c2lxdWUlJSBub24gw6ggJSVCb2R5YnVpbGRpbmclJS4gRSwgZGFpIHJpc3VsdGF0aSBkaSBxdWVzdG8gJSVNci4gT2x5bXBpYSUlLCDDqCBldmlkZW50ZSBjaGUgYW5jaGUgaSBnaXVkaWNpIHNvbm8gZCdhY2NvcmRvIGNvbiBsdWksIGVkIGhhbm5vIGRlY2lzbyBpbCBudW92byAlJXN0YW5kYXJkJSUgcGVyIGNvbWUgaWwgcGVyZmV0dG8gY2FtcGlvbmUgZGkgcXVlc3RhIGRpdmlzaW9uZSBkb3ZyZWJiZSBlc3NlcmUu', 'https://www.evolutionofbodybuilding.net/chris-bumstead-wins-the-2020-olympia-classic-physique-title/');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `IDPost` int(11) UNSIGNED NOT NULL,
  `IDUtente` varchar(150) NOT NULL,
  `numeroLike` int(11) NOT NULL,
  `Testo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`IDPost`, `IDUtente`, `numeroLike`, `Testo`) VALUES
(49, 'TWFyY29UZXNzZXI=', 0, 'SGV5IGNpYW8hIFF1YWxjdW5vIHNhIGNvbWUgZXNlZ3VpcmUgbmVsbGEgbWFuaWVyYSBtaWdsaW9yZSBwb3NzaWJpbGUgbCdlc2VyY2l6aW8gIlBhbmNhIHBpYW5hIGNvbiBiaWxhbmNpZXJlIiBldml0YW5kbyBhbmNoZSBkaSBpbmZvcnR1bmFyc2k/CkdyYXppZSBtaWxsZSBpbiBhbnRpY2lwbyE='),
(50, 'RW1tYVJvdmVyb25p', 0, 'Q2lhbyBhIHR1dHRpISBBdnJlaSB1bmEgZG9tYW5kYSBkYSBmYXJlIHN1bGxhIHJpY2V0dGEgZGVsIHBvbGxvIEFzaGF0aS4gUXVhbGN1bm8gc2Egc2Ugw6ggcG9zc2liaWxlIHNvc3RpdHVpcmUgaWwgcXVhcnRvIGRpIHRhenphIGRpIGdyYXNzbyBzY2lvbHRvIGNvbiBxdWFsY29zJ2FsdHJvIGRpIG1lbm8gY2Fsb3JpY28/ClBlcmNow6ggw6ggbCd1bmljbyBpbmdyZWRpZW50ZSBjaGUgaG8gdHJvdmF0byBuZWxsYSByaWNldHRhIGNoZSBwb3RyZWJiZSBlc3NlcmUgcHJvYmxlbWF0aWNvIHBlciBsYSBtaWEgZGlldGEuIEdyYXppZSBtaWxsZSBjaWFvb28hIA=='),
(51, 'TWFyY29VZGVyem8=', 0, 'UmFnYXp6aSwgZG9wbyB1bmEgbHVuZ2EgZmFzZSBkaSBhbGxlbmFtZW50byBpbCBtaW8gbnVvdm8gbWFzc2ltYWxlIGRpIHN0YWNjbyBkYSB0ZXJyYSDDqCBkaSAxNzBrZyBAIDYya2cgZGkgcGVzbyBjb3Jwb3JlbyE='),
(52, 'U2FtdWVsS29zdGFkaW5vdg==', 0, 'Q2hlIG5lIHBlbnNhdGUgZGVsbGUgaW5mb3JtYXppb25pIGRpIE1QTUQ/'),
(54, 'TWFyY29UZXNzZXI=', 0, 'RWhpbMOgLCBzdG8gY2VyY2FuZG8gZGkgc2VndWlyZSB1biBhbGxlbmFtZW50byBkaSB0aXBvIHB1c2ggcHVsbCBsZWdzIGUgc3RvIHVzYW5kbyBsYSBzY2hlZGEgZGkgYWxsZW5hbWVudG8gZGEgdm9pIHByb3Bvc3RhISBIbyBwZXLDsiBhbGN1bmUgZGlmZmljb2x0w6Agc3VsbCdlc2VjdXppb25lIGRlbCBjdXJsIGNvbiBtYW51YnJpIHN1IHBhbmNhIHNjb3R0LiBRdWFsY3VubyBwdcOyIGRhcm1pIHVuYSBkcml0dGE/');

-- --------------------------------------------------------

--
-- Table structure for table `risposta`
--

CREATE TABLE `risposta` (
  `IDRisposta` int(11) NOT NULL,
  `IDutente` varchar(150) NOT NULL,
  `Testo` text NOT NULL,
  `IDPost` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risposta`
--

INSERT INTO `risposta` (`IDRisposta`, `IDutente`, `Testo`, `IDPost`) VALUES
(25, 'TWFyY29VZGVyem8=', 'Q2lhbyEgUGVyIHByaW1hIGNvc2EgYXNzaWN1cmF0aSBzZW1wcmUgZGkgYXZlcmUgcXVhbGN1bm8gZGlldHJvIGRpIHRlLCBpbiBtb2RvIGNoZSBwb3NzYSBhc3Npc3RlcnRpIG5lbCBjYXNvIGZhbGxpc3NpIGwndWx0aW1hIHJpcGV0aXppb25lLiBQcmltYSBkaSBzdGFjY2FyZSBpbCBiaWxhbmNpZXJlLCBhZGR1Y2kgbGUgc2NhcG9sZS4gSW5hcmNhIGxhIHNjaGllbmEsIGluIG1vZG8gY2hlIGdsaSB1bmljaSBkdWUgcHVudGkgZGkgY29udGF0dG8gc2lhbm8gaSBnbHV0ZWkgZSBsZSBzY2Fwb2xlLiBEdXJhbnRlIGxhIGZhc2UgY29uY2VudHJpY2EgZGVsIHNvbGxldmFtZW50bywgY2VyY2EgZGkgZXNlcmNpdGFyZSBmb3J6YSBwcmVtZW5kbyBhIHRlcnJhIGUgaW5kaWV0cm8gY29uIGkgcXVhZHJpY2lwaXRpLCB0ZW5lbmRvIHNhbGRpIGkgcGllZGkgYSB0ZXJyYS4=', 49),
(26, 'U2FtdWVsS29zdGFkaW5vdg==', 'U2Ugc2VpIGRpc3Bvc3RhIGEgcmludW5jaWFyZSBhZCB1biBwbycgZGkgZ3VzdG8gaW4gcGnDuSwgdGkgZGlyZWkgY2hlIHB1b2kgYmVuaXNzaW1vIG5vbiBtZXR0ZXJlIGlsIGdyYXNzbyBzY2lvbHRvIGUgcHJvc2VndWlyZSBjb24gbGEgcmljZXR0YS4=', 50),
(27, 'YWRtaW4=', 'T3R0aW1vIE1hcmNvISBTaWFtbyBjb250ZW50aSBjaGUgY29uIGkgbm9zdHJpIGFsbGVuYW1lbnRpIHR1IHNpYSByaXVzY2l0byBhIHJhZ2dpdW5nZXJlIHF1ZXN0byB0cmFndWFyZG8h', 51),
(29, 'TWFyY29VZGVyem8=', 'SW5mb3JtYXppb25pIGRpIHF1YWxpdMOgLCBzb25vIHNlbXByZSBiYXNhdGUgc3UgZm9udGkgc2NpZW50aWZpY2hlIGFmZmlkYWJpbGksIGNvbWUgZ2xpIHN0dWRpIHB1YmJsaWNhdGkgc3UgUHViTWVkLg==', 52),
(30, 'RW1tYVJvdmVyb25p', 'Q29uZmVybW8gcXVlbGxvIGNoZSBoYSBkZXR0byBNYXJjbw==', 52),
(31, 'YWRtaW4=', 'Q2lhbyBtYXJjbywgY29udHJvbGxhIGxlIG5ld3MgZGkgd29ya291dCEgTmUgYWJiaWFtbyBhZ2dpdW50YSB1bmEgZ2l1c3RvIGwnYWx0cm8gZ2lvcm5vIHJpZ3VhcmRvIGwnZXNlY3V6aW9uZSBkZWwgY3VybCBjb24gbWFudWJyaSBzdSBwYW5jYSBzY290dCwgY29uIHZpZGVvIGFubmVzc28hISBGYWNjaSBzYXBlcmUsIGNpYW9vbyA6KQ==', 54);

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `IDUtente` varchar(150) NOT NULL,
  `Nome` varchar(150) NOT NULL,
  `Cognome` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` text NOT NULL,
  `Amministratore` tinyint(1) NOT NULL,
  `Bannato` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utente`
--

INSERT INTO `utente` (`IDUtente`, `Nome`, `Cognome`, `Email`, `Password`, `Amministratore`, `Bannato`) VALUES
('dXNlcg==', 'dXNlcg==', 'dXNlcg==', 'dXNlckBnbWFpbC5jb20=', 'b14361404c078ffd549c03db443c3fede2f3e534d73f78f77301ed97d4a436a9fd9db05ee8b325c0ad36438b43fec8510c204fc1c1edb21d0941c00e9e2c1ce2', 0, 0),
('RW1tYVJvdmVyb25p', 'RW1tYQ==', 'Um92ZXJvbmk=', 'ZW1tYS5yb3Zlcm9uaUBnbWFpbC5jb20=', '4c805fb46914992490f05b904e30b2a3840ad5dd48336b21addd503474866a11ab2ce1147f4b1c51de3d35bcd28a55c09054b7953887c66e014fddba9cdb2944', 0, 0),
('TWFyY29UZXNzZXI=', 'TWFyY28=', 'VGVzc2Vy', 'bWFyY28udGVzc2VyQGdtYWlsLmNvbQ==', '7350746c2106c01ec4b85b75fc5d9e9d32e1103667bd11fe45b5d983a8ba12bf7a6d2f14ec6a92de176cdfe90bb4bc6e9efcd5ea37316af5d3b52033172bc041', 0, 0),
('TWFyY29VZGVyem8=', 'TWFyY28=', 'VWRlcnpv', 'bWFyY28udWRlcnpvQGdtYWlsLmNvbQ==', '11c724908c020116ef6776ee0c627f7d8df5bc9caf4face309f0486ed7e6205c404a8b2c4548753787a917edd8b5e63c136557ee047c3fad859aecdc15c58dfa', 0, 0),
('U2FtdWVsS29zdGFkaW5vdg==', 'U2FtdWVs', 'S29zdGFkaW5vdg==', 'c2FtdWVsLmtvc3RhZGlub3ZAZ21haWwuY29t', '3330e27b41e71af747cb6bde4ac8078d4d7339f30309fe4578263f1a750cb68168d5f1fc8c2e275d338e7bbf9520a8c5f9019eb8ac3e93e3a5b4012599df7f56', 0, 0),
('YWRtaW4=', 'YWRtaW4=', 'YWRtaW4=', 'YWRtaW5AZ21haWwuY29t', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alimentazione`
--
ALTER TABLE `alimentazione`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`IDPost`,`IDUtente`),
  ADD KEY `LIKES_ibfk_2` (`IDUtente`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`IDPost`),
  ADD KEY `IDUtente` (`IDUtente`);

--
-- Indexes for table `risposta`
--
ALTER TABLE `risposta`
  ADD PRIMARY KEY (`IDRisposta`),
  ADD KEY `IDPost` (`IDPost`),
  ADD KEY `IDutente` (`IDutente`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`IDUtente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alimentazione`
--
ALTER TABLE `alimentazione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `IDPost` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `risposta`
--
ALTER TABLE `risposta`
  MODIFY `IDRisposta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `LIKES_ibfk_1` FOREIGN KEY (`IDPost`) REFERENCES `post` (`IDPost`),
  ADD CONSTRAINT `LIKES_ibfk_2` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`IDUtente`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `POST_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`IDUtente`);

--
-- Constraints for table `risposta`
--
ALTER TABLE `risposta`
  ADD CONSTRAINT `RISPOSTA_ibfk_1` FOREIGN KEY (`IDPost`) REFERENCES `post` (`IDPost`),
  ADD CONSTRAINT `RISPOSTA_ibfk_2` FOREIGN KEY (`IDutente`) REFERENCES `utente` (`IDUtente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
