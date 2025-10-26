<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\AuditLog\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class AuditLogDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $tableName,
        public readonly int $recordId,
        public readonly ?int $changedBy,
        public readonly string $changeType,
        public readonly array|null $oldValue,
        public readonly array|null $newValue,
        public readonly \DateTimeImmutable $changedAt,
        public readonly ?string $ipBin,
        public readonly ?string $userAgent,
        public readonly ?string $requestId
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
