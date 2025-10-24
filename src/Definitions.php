<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\AuditLog;

final class Definitions {
    // --- základní metadata ---
    public static function table(): string { return 'audit_log'; }
    public static function contractView(): string { return 'vw_audit_log'; }
    /** @return string[] */
    public static function columns(): array { return [ 'id', 'table_name', 'record_id', 'changed_by', 'change_type', 'old_value', 'new_value', 'changed_at', 'ip_bin', 'user_agent', 'request_id' ]; }
    public static function pk(): string { return 'id'; }

    // --- volitelná metadata (mohou být prázdná) ---
    public static function softDeleteColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function updatedAtColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null;
    }
    public static function versionColumn(): ?string {
        $c = ''; return $c !== '' ? $c : null; // pro optimistic locking
    }
    /** např. "created_at DESC, id DESC" */
    public static function defaultOrder(): ?string {
        $c = 'id DESC'; return $c !== '' ? $c : null;
    }
    /** @return array<int,array<int,string>> seznam unikátních klíčů (sloupcových kombinací) */
    public static function uniqueKeys(): array { return []; }
    /** @return string[] JSON sloupce kvůli castům/operacím */
    public static function jsonColumns(): array { return [ 'old_value', 'new_value' ]; }

    // --- pomocníci ---
    public static function hasColumn(string $col): bool {
        static $set = null;
        if ($set === null) { $set = array_fill_keys(self::columns(), true); }
        return isset($set[$col]);
    }
}
